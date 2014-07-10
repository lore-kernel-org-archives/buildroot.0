From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Jul 2014 14:42:06 +0200
Subject: [Buildroot] [PATCH 02/10] binutils: switch mips/mipsel/sh to
	binutils 2.21.1 by default
In-Reply-To: <1404237789-15563-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 1 Jul 2014 20:03:01 +0200")
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1404237789-15563-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8761j5qtb5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > For some reason, mips, mipsel and sh use binutils 2.21 as their
 > default version. Even though it would be nice to bump that to a much
 > newer version, we can safely assume that we can bump the default
 > version for those architecture to 2.21.1, which will allow the removal
 > of binutils 2.21.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This is obsoleted by the patches moving mips and sh to the default
version, so I've marked this as superseeded in pw.
-- 
Bye, Peter Korsgaard
