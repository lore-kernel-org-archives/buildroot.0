From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 00:09:16 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.54
In-Reply-To: <20200316165253.560773-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Mon, 16 Mar 2020 17:52:50 +0100")
References: <20200316165253.560773-1-joerg.krause@embedded.rocks>
Message-ID: <87imics1v7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Changes since version 5.52:
 > 5.54:
 >   Fix issue with HOGP to accept data only from bonded devices.
 >   Fix issue with A2DP sessions being connected at the same time.
 >   Fix issue with class UUID matches before connecting profile.
 >   Add support for handling MTU auto-tuning option for AVDTP.
 >   Add support for new policy for Just-Works repairing.
 >   Add support for Enhanced ATT bearer (EATT).

5.54 also fixes a security issue:

https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00352.html

So I've cherry-picked it for 2019.02.x, 2019.11.x and 2020.02.x after
updating the commit message to make the security impact clear.

-- 
Bye, Peter Korsgaard
