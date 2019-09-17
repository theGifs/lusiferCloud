<%--
  Created by IntelliJ IDEA.
  User: THE GIFTED
  Date: 2019/7/29
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>柱状图</title>
    <%String path = request.getContextPath();%>
    <script type="text/javascript" src="<%=path %>/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="<%=path %>/js/echarts.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/easyui/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>

<div id="bar_01" style="width: 800px;height: 500px"></div>

<script>

    $.get("<%=path%>/tbank/showcart", (data)=>{
        console.log(data)
       var names = data.map((val,index)=>{
            return val.name;
        })
        var values = data.map((val,index)=>{
            return val.value;
        })
        console.log(names)
        console.log(values)
        var myContainer = echarts.init(document.getElementById('bar_01'));
        option = {
            title : {
                text: '某地区Cart',
                subtext: '纯属虚构'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['办卡量']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : names
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [

                {
                    name:'办卡量',
                    type:'bar',
                    data:values

                }
            ]
        };

        myContainer.setOption(option)




    },'json')


</script>

</body>
</html>
