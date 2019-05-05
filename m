From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 May 2019 12:05:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/swupdate: bump to version
 2019.04
In-Reply-To: <1556978156-1626-1-git-send-email-pjtexier@koncepto.io>
 (Pierre-Jean Texier's message of "Sat, 4 May 2019 15:55:56 +0200")
References: <1556978156-1626-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <87sgttcj3h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre-Jean" == Pierre-Jean Texier <pjtexier@koncepto.io> writes:

 > New features in this release:
 > - Improved documentation
 > - delta updates based on rdiff library

Looking at https://sbabic.github.io/swupdate/swupdate.html, this seems
to rely on librsync, but I don't see any change to _DEPENDENCIES?

 > - support for libubootenv

Is that something that would be worthwhile to package?

 > - dry-run option
 > - CA certificates for signed images
 > - Fix security leak in parser

What does this mean exactly? Does this mean that this should be applied
to 2019.02.x as well?

-- 
Bye, Peter Korsgaard
