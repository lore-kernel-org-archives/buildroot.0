From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Apr 2021 12:12:13 +0200
Subject: [Buildroot] [PATCH 1/2] package/hostapd: add upstream patch to
 fix CVE-2021-30004
In-Reply-To: <20210426215553.11099-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 26 Apr 2021 23:55:52 +0200")
References: <20210426215553.11099-1-peter@korsgaard.com>
Message-ID: <87eeeud8g2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue for the internal TLS backend:
 > - CVE-2021-30004: In wpa_supplicant and hostapd 2.9, forging attacks may
 >   occur because AlgorithmIdentifier parameters are mishandled in tls/pkcs1.c
 >   and tls/x509v3.c.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
