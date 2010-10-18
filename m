From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Oct 2010 11:32:11 +0200
Subject: [Buildroot] [pull request] WiFi, openssl, rrdtool, gpsd, pppd,
	netsnmp
In-Reply-To: <4CADE306.1060003@zacarias.com.ar> (Gustavo Zacarias's message of
	"Thu, 07 Oct 2010 12:11:02 -0300")
References: <4CADE306.1060003@zacarias.com.ar>
Message-ID: <87bp6r4zj8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Some work on WiFi packages (wpa_supplicant & hostapd, latest stable).
 Gustavo> Fix netsnmp build breakage.
 Gustavo> Add gpsd.
 Gustavo> Add rrdtool.
 Gustavo> Fix/enhance pppd.
 Gustavo> Upgrade openssl (now with arm asm optimizations).

Thanks, committed everything except rrdtool (already in tree) and gpsd
(I didn't have time to review all the config options yet, will try to
get around to do so today)

-- 
Bye, Peter Korsgaard
