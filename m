From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Fri, 2 Dec 2011 10:59:30 -0600
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <001601ccb112$a16043b0$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98><001c01ccb07c$85e85190$0400a8c0@dspcgrnzks9p98><CAAXf6LUnHUAQk_4j2fyjE_tYum+U-i08aUKksK__tLOu0XgMeA@mail.gmail.com><201112020734.00122.minimod@morethan.org><001201ccb10b$22c23010$0400a8c0@dspcgrnzks9p98>
 <CAAu5YTas_VmvbHEkwOZqVZ3iD+sy4nYdmykMKZAagtAEYViYHA@mail.gmail.com>
 <001601ccb112$a16043b0$0400a8c0@dspcgrnzks9p98>
Message-ID: <002101ccb113$c2bf3e70$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I'm giving things a try with 2011.11 and when booting the board I see
this:

> 

> VFS: Mounted root (jffs2 filesystem) on device 31:1.

> Freeing init memory: 124K

> Kernel panic - not syncing: Attempted to kill init!

> 

 

If it helps any, I get this same error message whether I put the jffs2
filesystem at 0x400000 (four hundred thousand) or 0x2a0000 in Nandflash.  So
maybe the kernel doesn't know where to look?  When building kernel 2.6.33 in
2011.05 I would put kernel at 0xa0000 and filesystem at 0x400000 (four
hundred thousand).

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111202/8263d55f/attachment.html>
