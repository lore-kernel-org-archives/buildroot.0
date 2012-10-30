From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Oct 2012 09:59:57 +0100
Subject: [Buildroot] libglib and vim doesn't compile with -g3 -O0
In-Reply-To: <1643678760.226910251.1351587406802.JavaMail.root@zimbra49-e8.priv.proxad.net>
References: <209834601.226906150.1351587308354.JavaMail.root@zimbra49-e8.priv.proxad.net>
 <1643678760.226910251.1351587406802.JavaMail.root@zimbra49-e8.priv.proxad.net>
Message-ID: <20121030095957.692cf5a4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
