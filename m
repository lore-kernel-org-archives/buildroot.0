From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Jan 2010 17:26:27 +0100
Subject: [Buildroot] [PATCH 3/6] Move BR2_SOFT_FLOAT and BR2_VFP_FLOAT
	to Build options
In-Reply-To: <dec9e118437c50f39437596da1717c5117b8d416.1263338839.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Wed, 13 Jan 2010 00:27:22 +0100")
References: <cover.1263338839.git.thomas.petazzoni@free-electrons.com>
	<cover.1263338839.git.thomas.petazzoni@free-electrons.com>
	<dec9e118437c50f39437596da1717c5117b8d416.1263338839.git.thomas.petazzoni@free-electrons.com>
Message-ID: <871vhanqks.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The soft floating point related options not only affect how the
 Thomas> toolchain is built, but more importantly affect how packages are
 Thomas> built. Therefore, just like optimization or stripping options,
 Thomas> floating point related options are global, and belong to the Build
 Thomas> options menu.

Hmm, couldn't you say the same for ipv6, largefile and locale stuff?

-- 
Bye, Peter Korsgaard
