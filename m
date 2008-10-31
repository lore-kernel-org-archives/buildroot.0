From: Nick Peirson <nick@netcentral.co.uk>
Date: Fri, 31 Oct 2008 10:57:15 +0000
Subject: [Buildroot] Patch review
In-Reply-To: <20081031104315.GJ26468@mx.loc>
References: <490AD4EF.1010106@netcentral.co.uk> <20081031104315.GJ26468@mx.loc>
Message-ID: <490AE48B.20306@netcentral.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Reutner-Fischer wrote:
> I did not need any patches to syslinux itself but had to add nasm
> support for both the host and the target?

I added nasm on the host, but didn't make any changes to the target. The 
error I was getting was due to syslinux makefile specifying "-Wall 
-Werror" and printf throwing a warning when called without a format string.

> Did you send the non-makefile patch upstream? If you didn't already then
> please do now..

I wasn't sure if the bug was related to buildroot/uclibc, which I 
mentioned in the bug notes, but I'll send it upstream and see what's 
made of it.

Thanks
Nick
