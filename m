From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Thu, 17 Feb 2011 11:50:19 +0000
Subject: [Buildroot] First day with buildroot
In-Reply-To: <AANLkTimbBptSub=x_KvcnAt+And2=-NpAPH+m8RR5vmH@mail.gmail.com>
References: <AANLkTimbBptSub=x_KvcnAt+And2=-NpAPH+m8RR5vmH@mail.gmail.com>
Message-ID: <1297943420.4856.2.camel@dublxciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ar C?ad, 2011-02-16 at 20:12 -0800, Charles Krinke wrote:

> Below are the last half dozen lines of my first compile with
> buildroot. I set it up for a powerpc architecture and selected almost
> all the defaults, changing only things like ext2 to jffs2 file system.
> I did select the "general" for sub-architecture (as opposed to say,
> e300c2). 
> /usr/bin/ld: cannot find -lc
> -- 

"sudo yum install glibc-static"
You need the static C library to build host-module-init-tools

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110217/d05c5df9/attachment-0001.html>
