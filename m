From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Sep 2011 15:26:49 +0200
Subject: [Buildroot] [git commit] iw: bump to 3.1
In-Reply-To: <1316001130.5304.4.camel@sven> (Sven Neumann's message of "Wed,
 14 Sep 2011 13:52:08 +0200")
References: <20110913214743.1465A8D5A4@busybox.osuosl.org>
 <1316001130.5304.4.camel@sven>
Message-ID: <87sjnztfty.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Hi,
 Sven> On Tue, 2011-09-13 at 23:44 +0200, Peter Korsgaard wrote:

 >> -IW_VERSION = 3.0
 >> +IW_VERSION = 3.1
 >> IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 >> IW_SITE = http://wireless.kernel.org/download/iw

 Sven> Does anyone happen to know an alternative download location for
 Sven> iw-3.0.1.tar.bz2 ?

 Sven> As you probably know kernel.org is down for maintainance and
 Sven> sources.buildroot.net does not seem to provide this release (yet).

Ahh yes, sorry - I fixed it up for util-linux, but I missed that
one. I've populated sources.buildroot.net with the copy from here;

http://linuxwireless.org/download/iw/iw-3.1.tar.bz2

-- 
Bye, Peter Korsgaard
