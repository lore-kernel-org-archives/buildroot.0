From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jul 2014 20:12:11 +0200
Subject: [Buildroot] rpcbind & portmap and nfs extra hints.
In-Reply-To: <B3E015034CA14BF9A830C4AE5D7E9269@JohanW7>
References: <B3E015034CA14BF9A830C4AE5D7E9269@JohanW7>
Message-ID: <20140701201211.7c84f1c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Tue, 1 Jul 2014 20:08:00 +0200, Sagaert Johan wrote:

>  It seems you don't need portmap or rpcbind if you mount an nfs share with the -o onlock option.
>  Without the -o nolock you need some rpc locking system like portmap or rpcbind.
> 
>  Should this info be put somewhere in the help of the menu options ?

I'm not really sure where it would belong to. We could indicate that in
the portmap and rpcbind help text, but it wouldn't help users trying to
do NFS mounts and not knowing about portmap/rpcbind.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
