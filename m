From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:29:50 +0200
Subject: [Buildroot] [PATCH] package/hiredis: fix install step for
	static build only
In-Reply-To: <20170414130225.16408-1-romain.naour@gmail.com> (Romain Naour's
 message of "Fri, 14 Apr 2017 15:02:25 +0200")
References: <20170414130225.16408-1-romain.naour@gmail.com>
Message-ID: <87fugxvc29.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The previous patch [1] didn't take into acount the static build only
 > scenario. It try to install unconditionally a shared library.

 > Handle the install step like for bzip2 package.

 > Install the shared library only if BR2_SHARED_LIBS or
 > BR2_SHARED_STATIC_LIBS is set and install the static library only
 > if BR2_STATIC_LIBS or BR2_SHARED_STATIC_LIBS is set.

 > [1] 96daacb720cffe1f83259462bef9d3da92925cd9

 > Fixes:
 > http://autobuild.buildroot.net/results/6be/6be8024dd664af83fcf49ede29c8ad59a37f73d1

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
