From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Aug 2009 17:14:22 +0200
Subject: [Buildroot] [PATCH 1/3] netsnmp: convert to autotools.in and
	fix build issues
In-Reply-To: <d96368ad9339edf62aa87890d5cea79bf7ddfc34.1249395336.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue\,
	4 Aug 2009 16\:15\:37 +0200")
References: <cover.1249395336.git.thomas.petazzoni@free-electrons.com>
	<cover.1249395336.git.thomas.petazzoni@free-electrons.com>
	<d96368ad9339edf62aa87890d5cea79bf7ddfc34.1249395336.git.thomas.petazzoni@free-electrons.com>
Message-ID: <874osnr4q9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Moreover, we introduce a patch to the build system so that it
 Thomas> doesn't call ldconfig on /usr/lib at install time, which is
 Thomas> completely useless when doing cross-compilation.

Wouldn't it be simpler to just provide a different value to
LIB_LDCONFIG_CMD on the make commandline instead of the patch?

-- 
Bye, Peter Korsgaard
