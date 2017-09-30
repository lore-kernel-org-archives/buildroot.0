From: grunpferd at netscape.net <grunpferd@netscape.net>
Date: Sat, 30 Sep 2017 06:10:31 -0400
Subject: [Buildroot] Build failure in icu-59.1
In-Reply-To: <9e80ea0d-e905-7d59-2f71-c6012be2d57a@gmail.com>
Message-ID: <15ed2440e84-c0c-47182@webjas-vaa141.srv.aolmail.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net





Thanks Romain,


> glibc has been updated to 2.26 recently and the xlocale.h header file has been
> removed.
> See https://sourceware.org/glibc/wiki/Release/2.26#Packaging_Changes
> 
> I tested several packages with this new version but it's difficult to test every
> single packages.

> Can you report to the upstream project or if it's already fixed upstream, send
> the patch to the ml?


I have have lodged bug report with ICU project. As far as I can tell it has not been fixed or reported.


I think your analysis is correct, the advance to glibc 2.26 has flushed out this problem.
How this gets fixed may depend on the ICU project that has icu 59.1 as their latest release.
In the mean time buildroot might have to handle this by itself.




Regards,


Ross


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170930/d98236af/attachment.html>
