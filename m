From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Jul 2013 21:45:00 +0200
Subject: [Buildroot] [PATCH 1/3] efl: factorize version number as
	EFL_VERSION
In-Reply-To: <1373209644-18260-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 7 Jul 2013 17:07:22 +0200")
References: <1373209644-18260-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878v1ii283.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> All the EFL components are released simultaneously, with an
 Thomas> identical version number, just like all Qt5 components for
 Thomas> example. So it makes sense to have a single EFL_VERSION
 Thomas> variable in package/efl/efl.mk that is used by all the packages
 Thomas> in package/efl/*/*.mk.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
