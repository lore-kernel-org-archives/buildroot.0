From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 May 2014 22:21:10 +0200
Subject: [Buildroot] [PATCH] pciutils: disallow on Blackfin
In-Reply-To: <1400600889-3386-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 20 May 2014 17:48:09 +0200")
References: <1400600889-3386-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wqdggq15.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Even though some Blackfin processors have PCI interfaces, the PCI
 > support is not supported by the Linux kernel: it has been marked as
 > broken since 2008. This means there's probably little interest for PCI
 > on Blackfin, and consequently little interest about getting pciutils
 > to build.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

You forgot to add references to the autobuilder failures. Committed with
that fixed, thanks.

-- 
Bye, Peter Korsgaard
