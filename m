From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jan 2014 09:25:19 +0100
Subject: [Buildroot] [PATCH v3 1/6] Makefile: introduce BR2_PATH
In-Reply-To: <1391114333-28001-2-git-send-email-s.martin49@gmail.com>
References: <1391114333-28001-1-git-send-email-s.martin49@gmail.com>
 <1391114333-28001-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20140131092519.787a1f4d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 30 Jan 2014 21:38:48 +0100, Samuel Martin wrote:
> Since the HOST_PATH and TARGET_PATH variables almost contain the same
> things, let's factorize this in a single BR2_PATH.

I am wondering about the name BR2_PATH. Normally, BR2_<something> is
used for variables coming from Kconfig options. Introducing the
BR2_PATH variable, which doesn't come from a Kconfig option seems to
violate this unwritten rule.

That being said, we can't call the variable just PATH, so I'm not sure
which name we should choose. BR_PATH ? BUILDROOT_PATH ? PKG_PATH ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
