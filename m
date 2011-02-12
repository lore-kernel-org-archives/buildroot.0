From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Sat, 12 Feb 2011 01:00:33 +0000
Subject: [Buildroot] [PATCH] mplayer: bump version to fix build error
In-Reply-To: <87fwrvhbwi.fsf@macbook.be.48ers.dk>
References: <1297356435-11303-1-git-send-email-bjorn.forsman@gmail.com>
	<87fwrvhbwi.fsf@macbook.be.48ers.dk>
Message-ID: <1297472433.15934.2.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On Thu, 2011-02-10 at 21:28 +0100, Peter Korsgaard wrote: 
> >>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:
> 
>  Bj?rn> Bump mplayer to the first version that fixes this issue:
>  Bj?rn> file.c:23:5: warning: "HAVE_MMAP" is not defined
>  Bj?rn> file.c:25:7: warning: "HAVE_MAPVIEWOFFILE" is not defined
>  Bj?rn> file.c:77:5: warning: "HAVE_MMAP" is not defined
>  Bj?rn> file.c:87:7: warning: "HAVE_MAPVIEWOFFILE" is not defined
>  Bj?rn> file.c:124:5: warning: "HAVE_MMAP" is not defined
>  Bj?rn> file.c:126:7: warning: "HAVE_MAPVIEWOFFILE" is not defined
>  Bj?rn> file.c: In function 'av_file_map':
>  Bj?rn> file.c:50: error: 'HAVE_MMAP' undeclared (first use in this function)
>  Bj?rn> file.c:50: error: (Each undeclared identifier is reported only once
>  Bj?rn> file.c:50: error: for each function it appears in.)
>  Bj?rn> make[2]: *** [file.o] Error 1
> 
> Committed, thanks.

Hi, 
mplayer, now, has been compiled successfully on mipsel , without any
changes. 
Thanks, 

-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3309 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110212/aeb98f05/attachment.bin>
