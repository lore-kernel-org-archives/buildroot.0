From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Jun 2014 21:25:07 +0200
Subject: [Buildroot] [PATCH v2 1/2] hostapd: bump to version 2.2
In-Reply-To: <beac89df1d15b9b192b30dbd1e1363d5a11c7833.1401978259.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 5 Jun 2014 17:24:18 +0300")
References: <beac89df1d15b9b192b30dbd1e1363d5a11c7833.1401978259.git.baruch@tkos.co.il>
Message-ID: <87egz3noq4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Drop upstream patch.

Heh, they must have been waiting for me to add the patch ;)

 > CONFIG_IEEE80211W is now enabled by default.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2:
 > 	Remove CONFIG_IEEE80211W (Gustavo Zacarias)

Committed, thanks.

-- 
Bye, Peter Korsgaard
