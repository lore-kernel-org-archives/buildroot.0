From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 21:18:50 +0100
Subject: [Buildroot] [PATCH v2] augeas: bump to version 1.9.0
In-Reply-To: <20180114163412.16548-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Sun, 14 Jan 2018 17:34:12 +0100")
References: <20180114163412.16548-1-joerg.krause@embedded.rocks>
Message-ID: <87fu76ub85.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Add two patches from upstream to fix a build issue when building an
 > example. Ideally, the examples should not be build at all. However,
 > upstream disliked the idea of adding configure options like
 > `--disable-examples` [1]. So we'll make do with the patches and force a
 > autoreconf.

 > Additionaly, the signature was checked and a hash for the license file
 > is added.

 > [1] https://github.com/hercules-team/augeas/issues/535

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 > ---
 > v2 (suggested by Thomas):
 >  * Add missing reference and SoB to upstream patches
 >  * Improve comment for AUTORECONF=YES

Committed, thanks.

-- 
Bye, Peter Korsgaard
