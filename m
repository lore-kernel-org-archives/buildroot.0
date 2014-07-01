From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 1 Jul 2014 20:08:00 +0200
Subject: [Buildroot] rpcbind & portmap and nfs extra hints.
Message-ID: <B3E015034CA14BF9A830C4AE5D7E9269@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
 Hi All;

 It seems you don't need portmap or rpcbind if you mount an nfs share with the -o onlock option.
 Without the -o nolock you need some rpc locking system like portmap or rpcbind.

 Should this info be put somewhere in the help of the menu options ?


Regards 
Sagaert Johan
