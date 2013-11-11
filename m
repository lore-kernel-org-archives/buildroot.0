From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 15:07:08 +0100
Subject: [Buildroot] [PATCH] ethtool: bump version to 3.12.1
In-Reply-To: <1384178326-29222-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 11 Nov 2013 14:58:46 +0100")
References: <1384178326-29222-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877gcf6nhv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

> 3.12 release notes:
> 	* Fix: Remove alternate method to check for VLAN tag offload on Linux
> 	  < 2.6.37 (-k/-K options)
> 	* Fix: Hide state of VLAN tag offload and LRO if the kernel is too old
> 	  for us to reliably detect them (-k option)
> 	* Feature: Add register dump support for Solarflare SFC9100 family
> 	  (-d option)

> 3.12.1 release notes:

> This includes a couple of changes that should have gone into 3.12.

> 	* Fix: Memory corruption when applying external calibration to
> 	  SFF-8472 module diagnostics (-m option)
> 	* Feature: Add Intel 82599 and x540 DCB registers to dump
> 	  (-d option)

Committed, thanks.

-- 
Bye, Peter Korsgaard
