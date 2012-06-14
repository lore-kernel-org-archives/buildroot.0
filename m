From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 Jun 2012 07:55:32 +0200
Subject: [Buildroot] [PATCH] xserver_xorg-server: backport hotplug
	support
In-Reply-To: <20120613182859.3217c88c@skate> (Thomas Petazzoni's message of
 "Wed, 13 Jun 2012 18:28:59 +0200")
References: <1339603696-2787-1-git-send-email-rbraun@sceen.net>
 <20120613182859.3217c88c@skate>
Message-ID: <87r4tiwi7f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Unless I'm wrong X11R7.7 has been released some time ago, and
 Thomas> it includes X server 1.12, at
 Thomas> http://www.x.org/releases/X11R7.7/src/xserver/. So why would we
 Thomas> bother backporting 1.8 material to a 1.7 version? Upgrading the
 Thomas> complete X.org stack to X11R7.7 seems like a much more
 Thomas> appropriate solution. Or maybe I'm missing something obvious?

 Thomas> Moreover in general, we don't like to carry patches that aim at
 Thomas> adding features. We carry patches to fix build problems, or
 Thomas> sometimes architecture-specific fixes, but large new features
 Thomas> should not be added to packages using patches, otherwise
 Thomas> Buildroot will become an unmaintainable crap of patches.

Agreed.

-- 
Bye, Peter Korsgaard
