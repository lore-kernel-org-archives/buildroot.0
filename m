From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 15:19:53 +0100
Subject: [Buildroot] [PATCH] swupdate: remove empty line
In-Reply-To: <20180114175306.18388-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Sun, 14 Jan 2018 18:53:06 +0100")
References: <20180114175306.18388-1-joerg.krause@embedded.rocks>
Message-ID: <876083w6eu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Reported by Yann E. Morin running:
 > ```
 >     $ ./utils/check-package package/swupdate/swupdate.mk
 >     package/swupdate/swupdate.mk:42: consecutive empty lines
 >     140 lines processed
 >     1 warnings generated
 > ```

 > Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
