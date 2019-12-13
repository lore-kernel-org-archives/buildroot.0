From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Dec 2019 21:05:26 +0100
Subject: [Buildroot] [PATCH] package/openpowerlink: drop bogus select
In-Reply-To: <20191213152847.1377137-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 13 Dec 2019 16:28:47 +0100")
References: <20191213152847.1377137-1-thomas.petazzoni@bootlin.com>
Message-ID: <87mubwf0u1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > There is no option BR2_PACKAGE_OPENPOWERLINK_PCAP_DAEMON, and we never
 > had any option named like this, so it seems like a leftover from
 > previous iterations of the openpowerlink patch series. Since the
 > option does not exist, the select doesn't do anything, and we can
 > simply drop it.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
