From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Sep 2019 22:40:43 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/libnss: security bump to
 version 3.46
In-Reply-To: <20190903101216.20337-2-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Tue, 3 Sep 2019 12:12:16 +0200")
References: <20190903101216.20337-1-giulio.benetti@micronovasrl.com>
 <20190903101216.20337-2-giulio.benetti@micronovasrl.com>
Message-ID: <87v9tq1ws4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > Fixes the following security issues:
 > (3.44.1)
 > CVE-2019-11729: More thorough input checking
 > CVE-2019-11719: Don't unnecessarily strip leading 0's from key material
 > during PKCS11 import
 > CVE-2019-11727: Prohibit use of RSASSA-PKCS1-v1_5 algorithms in TLS 1.3

 > Note:
 > This version requires nspr 4.22 or newer provided by the previous patch.

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
