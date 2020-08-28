From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 16:54:41 +0200
Subject: [Buildroot] [PATCH 1/2] package/pkg-kconfig: Support custom
 $(MAKE)
In-Reply-To: <20200804190005.114872-1-brandon.maier@rockwellcollins.com>
 (Brandon Maier's message of "Tue, 4 Aug 2020 14:00:04 -0500")
References: <20200804190005.114872-1-brandon.maier@rockwellcollins.com>
Message-ID: <87eenqyg5q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Brandon" == Brandon Maier <brandon.maier@rockwellcollins.com> writes:

 > The U-Boot package requires GNU Make v4.0 or later, and so all U-Boot
 > "make" commands must use "$(BR2_MAKE)" so they use the host-make
 > package. Currently pkg-kconfig is hardcoded to uses $(MAKE), so add a
 > way to support $(BR2_MAKE). The package infra for pkg-automake and
 > pkg-cmake have a similar problem, and they solved it by defining a
 > $(PKG)_MAKE variable, and allowing each package to override it.

 > Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
