From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 15:06:20 +0100
Subject: [Buildroot] [PATCH] pciutils: bump version
In-Reply-To: <1384178128-27587-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 11 Nov 2013 14:55:28 +0100")
References: <1384178128-27587-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fvr36nj7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

>> From the release announcement e-mail:
> I have just released version 3.2.1 of the pciutils. It's purely
> a maintenance release with a couple of minor bug fixes and minor
> improvements. Thus quoth the changelog:

> 2013-11-10  Martin Mares <mj@ucw.cz>

> 	* Released as 3.2.1.

> 	* CardBus bridge capabilities are displayed.

> 	* PCIe L1 PM substates are decoded.

> 	* Various bugs were fixed in decoding of PCIe capabilities.

> 	* The sysfs back-end does not spit out unnecessary warnings when
> 	  empty slots report only a partial device address. This actually
> 	  happens on IBM pSeries.

> 	* Updated pci.ids to the today's snapshot of the database.

Committed, thanks.

-- 
Bye, Peter Korsgaard
