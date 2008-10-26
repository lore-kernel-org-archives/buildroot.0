From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Oct 2008 07:20:03 +0100
Subject: [Buildroot] [PATCH] package: remove/replace PKG_CONFIG_SYSROOT
In-Reply-To: <20081025205424.78d812d4@surf> (Thomas Petazzoni's message of
	"Sat\, 25 Oct 2008 20\:54\:24 +0200")
References: <200810250108.06823.markus.heidelberg@web.de>
	<20081025205424.78d812d4@surf>
Message-ID: <87wsfv7u98.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Sat, 25 Oct 2008 01:08:06 +0200,
 Thomas> Markus Heidelberg <markus.heidelberg@web.de> a ?crit :

 >> PKG_CONFIG_SYSROOT is not recognized by pkg-config,
 >> PKG_CONFIG_SYSROOT_DIR is the valid environment variable name.

 Thomas> These variables are already defined in TARGET_CONFIGURE_OPTS in
 Thomas> package/Makefile.in. Just drop them in your packages.

Exactly. I've fixed that in r23794.

-- 
Bye, Peter Korsgaard
