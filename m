From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Dec 2016 10:51:57 +0100
Subject: [Buildroot] [PATCH] netsnmp: handle libnl dependency properly
In-Reply-To: <1481704008-5590-1-git-send-email-julien.floret@6wind.com>
 (Julien Floret's message of "Wed, 14 Dec 2016 09:26:48 +0100")
References: <1481704008-5590-1-git-send-email-julien.floret@6wind.com>
Message-ID: <87inqm25z6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Floret <julien.floret@6wind.com> writes:

 > libnl3 include path was hardcoded in the configure script,
 > causing the following gcc warning:

 > WARNING: unsafe header/library path used in cross-compilation:
 > '/usr/include/libnl3'

 > Let's apply an upstream patch that addresses the issue: now
 > pkg-config is used to detect libnl include path.

 > Also:
 > - add optional libnl build dependency;
 > - enable libnl support only when libnl package is selected.

 > Signed-off-by: Julien Floret <julien.floret@6wind.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
