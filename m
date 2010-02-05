From: Cyril HAENEL <chaenel@free.fr>
Date: Fri, 05 Feb 2010 10:20:56 +0100
Subject: [Buildroot] buildroot Config file for AT91SAM9261
In-Reply-To: <532dd5841002042323r9e982c7nd4f8bc2762cc446@mail.gmail.com>
References: <532dd5841002042323r9e982c7nd4f8bc2762cc446@mail.gmail.com>
Message-ID: <4B6BE2F8.5020706@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Ravi Kumar Kulkarni a ?crit :
> Dear all,
> can anybody give me a working config file to build  buildroot for
> AT91SAM9261 board . im trying to build Jffs2 file system for target
> but unable to do so. so would like to try some working config file n
> then compare the two as im new to embedded linux. thanks.
> warm regards,
> Ravi Kulkarni.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>   
Hi,

I use a custom board with a AT91SAM9260 and jffs2 in a 512Mib nand 
flash. I use buildroot 2009.05 release, it works well, here is my 
.config file

Regards,
Cyril HAENEL

-- 

Cyril Haenel
Registered Linux User #332632

-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.tar.gz
Type: application/x-gzip
Size: 5307 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100205/472b2414/attachment.bin>
