From: David Bonnin <dboml@free.fr>
Date: Tue, 30 Oct 2012 10:53:24 +0100 (CET)
Subject: [Buildroot] libglib and vim doesn't compile with -g3 -O0
In-Reply-To: <20121030095957.692cf5a4@skate>
Message-ID: <1184166027.227040120.1351590804295.JavaMail.root@zimbra49-e8.priv.proxad.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Files are join to this mail.
It is an external toolchain build with CTNG 1.16.0+hg+unknown-20120917.140812. with toolchain suite src from linaro linaro-4.7-2012.08

forgot BR version: 2012.08

Thanks,

David Bonnin.

----- Mail original -----
De: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
?: dboml at free.fr
Cc: "buildroot" <buildroot@busybox.net>
Envoy?: Mardi 30 Octobre 2012 09:59:57
Objet: Re: [Buildroot] libglib and vim doesn't compile with -g3 -O0

Hello,

On Tue, 30 Oct 2012 09:56:46 +0100 (CET), dboml at free.fr wrote:

> For information my gdb error before rebuild BR with -g3 -O0: 

[..]

> 021,773 &"warning: Unable to find dynamic linker breakpoint function.\nGDB will be unable to debug shared library initializers\nand track explicitly loaded dynamic code." 
> 021,773 &"\n" 
> 021,793 *stopped,frame={addr="0x4006ad10",func="??",args=[]},thread-id="1",stopped-threads="all",cor\ 
> e="0" 

Which toolchain are you using? Please post your Buildroot .config file.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br.config
Type: application/xml
Size: 25693 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121030/1f27f13c/attachment-0002.wsdl>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: crosstool.config
Type: application/xml
Size: 12279 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121030/1f27f13c/attachment-0003.wsdl>
