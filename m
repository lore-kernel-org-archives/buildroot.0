From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 09:48:42 +0100
Subject: [Buildroot] [PATCH 1/1] Fix alioth.debian URLs that are broken
In-Reply-To: <1391462573-13068-1-git-send-email-rjbarnet@rockwellcollins.com>
 (Ryan Barnett's message of "Mon, 3 Feb 2014 22:22:53 +0100")
References: <1391462573-13068-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <87ob2nmff9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryanbarnett3@gmail.com> writes:

 > Inspired by a patch from Martin Bark <martin@barkynet.com>, this fixes
 > autobuild issues related to packages not downloading from alioth.debian
 > URLs. This patches is meant to be "temporary" until the URLs are fixed
 > by debain.

s/debain/debian/ ;)

 > Fixes:
 >   http://autobuild.buildroot.org/results/8c3/8c34649a7f98f60f14cff8b32fa2f8e82b1afeb6
 >   http://autobuild.buildroot.org/results/7e3/7e34e73e40fdb0e04bd63fa889f9bc14f7e30536

Committed, thanks.

-- 
Bye, Peter Korsgaard
