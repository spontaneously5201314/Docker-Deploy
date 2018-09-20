annotations:
    与label不同的地方在于，它不能用于挑选资源，仅用于为对象提供“元数据”。
Pod的生命周期：
    状态：
        Pending,Running,Failed,Succesed,Unknown
    创建Pod：
        Pod：生命周期中的重要行为： 
            初始化容器
            容器探测：liveness,readiness
            为什么要做容器探测？
                因为如果一个容器启动了，可能会被立即加入到service中去，但是容器中的应用可能还尚未部署完成，那么这个时候并不能处理请求
                所以一定要做探测，探测到如果容器里面的服务都ready，才可以真正的加入到service中
restartPolicy:
    Always,OnFailure,Never,Default to Always
探针类型有三种：
    ExecAction,TCPSocketAction,HTTPGetAction
    
Pod控制器
    ReplicationController
    ReplicationSet
    Deployment:自动控制Pod的生命周期
    DaemonSet:常用于系统级的后台任务，比如说ELK的日志收集agent端，一个节点只需要一个服务即可
    以上的控制器的特点：1.应用是无状态的，2.是持续后台运行的
    Job:是否重建的前提是任务是不是完成，但只能执行一次性的作业
    CronJob:周期运行
    StatefulSet:保存有状态的应用
控制器的关键点是，一定要有节点选择器


Service
    工作模式：userspace(1.1之前版本),iptables(1.10之前版本),ipvs(1.11及之后版本)