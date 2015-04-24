From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Apr 2015 12:20:52 +0200
Subject: [Buildroot] [PATCH] wpa_supplicant: add fix for CVE-2015-1863
In-Reply-To: <ae747360e1b88e5f8f2ecfd38130aebc21a73682.1429859326.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 24 Apr 2015 10:08:46 +0300")
References: <ae747360e1b88e5f8f2ecfd38130aebc21a73682.1429859326.git.baruch@tkos.co.il>
Message-ID: <87tww5rfnf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add upstream patch fixing CVE-2015-1863: buffer overflow of SSID buffer within
 > struct p2p_device that is allocated from heap.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
