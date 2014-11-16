From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Nov 2014 22:58:23 +0100
Subject: [Buildroot] [PATCH] package/libv4l: needs headers >= 3.0
In-Reply-To: <1416149067-19925-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 16 Nov 2014 15:44:27 +0100")
References: <1416149067-19925-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87fvdierk0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > libv4l includes linux/media.h, which was introduced in v.2.6.39.
 > So, require at least 3.0 to be sure, since we have toolchains (like the
 > Code Sourcery Powerpc 2011.03) that still use 2.6.38 headers.

 > Fixes:
 >     http://autobuild.buildroot.net/results/ff7/ff7977c1cea0edfd230e12b74fc2c34bac7a0e4e/
 >     http://autobuild.buildroot.net/results/2bd/2bd30d942ec718e0a46ba2d1c043c9b6e2e6578b/
 >     http://autobuild.buildroot.net/results/c37/c371f4de7ec4b959310ca8e08cf289385fa0feae/
 >     ...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
