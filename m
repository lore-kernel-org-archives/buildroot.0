From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Sep 2012 21:51:44 +0200
Subject: [Buildroot] [PATCH 1/3] alsa-lib: put
	BR2_PACKAGE_ALSA_LIB_PYTHON under the existing if condition
In-Reply-To: <1347988898-5279-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 18 Sep 2012 19:21:36 +0200")
References: <1347988898-5279-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mx0k8obz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Instead of duplicating the "depends on BR2_PACKAGE_ALSA_LIB", just put
 Thomas> BR2_PACKAGE_ALSA_LIB_PYTHON under the existing condition "if
 Thomas> BR2_PACKAGE_ALSA_LIB".

Committed all 3, thanks.

-- 
Bye, Peter Korsgaard
