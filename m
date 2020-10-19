From: dfanton <d.fanton@gds.com>
Date: Mon, 19 Oct 2020 04:18:14 -0500 (CDT)
Subject: [Buildroot] MongoDb storage engine problem
Message-ID: <1603099094833-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello 
I'm using buildroot 2020.08.1 in one board with IMX6, mongodb and python3 
The buildroot do the process perfect without problem but when I try to use
the mongod i received this error
Cannot start server with an unknown storage engine I make some test but I
can't find a way to run it. 
I understand from the last version remove the engine mmapv1 and can use only
wiredTiger I have try do downgrade mongo db packange but if I do this I find
an other problem
print( "python version: " + " ".join( [ `i` for i in sys.version_info ] ) ) 
SyntaxError: invalid syntax 
I have try to downgrad to gcc 7 but the problem still present. I can't go to
version before because the 5.7 of the kernel can't give the possibility to
go with version lower (I know is fixed with version 5) 
Please any advise is really appreciated 




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
