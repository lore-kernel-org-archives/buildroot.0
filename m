From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Dec 2019 21:05:31 +0100
Subject: [Buildroot] [PATCH] package/gpsd: remove bogus select of
 BR2_PACKAGE_GPSD_NTP_SHM
In-Reply-To: <20191213153044.1382229-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 13 Dec 2019 16:30:43 +0100")
References: <20191213153044.1382229-1-thomas.petazzoni@bootlin.com>
Message-ID: <87immkf0tw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In commit 57f85e52a7b29363e76735930bc1bb51a38718ac ("package/gpsd:
 > unconditionally enable NTP time hinting support"), the option
 > BR2_PACKAGE_GPSD_NTP_SHM was removed, because NTP time hinting support
 > is now enabled unconditionally.

 > However, in one place, a select of this option was kept, which is
 > obviously no longer needed.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
