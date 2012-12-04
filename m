From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Dec 2012 20:42:32 +0100
Subject: [Buildroot] elfutils and the perf userspace tool
In-Reply-To: <50BE4D1C.3020702@petroprogram.com>
References: <1354573207.60693.YahooMailNeo@web120305.mail.ne1.yahoo.com>
 <CAJ+oik2wb+izT2we-WcnK5cTEtzo-_jW46Q98UMm=XfbCSqAWA@mail.gmail.com>
 <1354608794.90144.YahooMailNeo@web120304.mail.ne1.yahoo.com>
 <50BE4D1C.3020702@petroprogram.com>
Message-ID: <20121204204232.3e5b0ec9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Tue, 04 Dec 2012 21:21:00 +0200, Stefan Fr?berg wrote:
> And there was some other (uClibc related) stuff that needed patching
> too that I can't now
> remember
> 
> All in all, elfutils belongs sadly to the software category:
> 
>  "Im doing things my own way, Im using non-portable glibc stuff and
> I don't give a crab about portability. Nah-nah-naaa"
> 
> :-(

Don't reinvent the wheel:

  http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/elfutils/elfutils/uclibc-support.patch

And possibly other patches in:

 http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/elfutils/elfutils

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
