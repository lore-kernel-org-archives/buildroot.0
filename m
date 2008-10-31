From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 31 Oct 2008 11:43:15 +0100
Subject: [Buildroot] Patch review
In-Reply-To: <490AD4EF.1010106@netcentral.co.uk>
References: <490AD4EF.1010106@netcentral.co.uk>
Message-ID: <20081031104315.GJ26468@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 31, 2008 at 09:50:39AM +0000, Nick Peirson wrote:
> Would it be possible for the patch against bug  
> http://bugs.uclibc.org/view.php?id=5674 to be reviewed and, hopefully,  
> commited to svn?
>
> The patch (attached) bumps the syslinux version and updates the patches  
> required for it to compile.

I did not need any patches to syslinux itself but had to add nasm
support for both the host and the target?

Did you send the non-makefile patch upstream? If you didn't already then
please do now..
