From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 30 Aug 2014 09:17:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: disable for Blackfin
	GNU Toolchain
In-Reply-To: <1408999005-15853-1-git-send-email-jkrause@posteo.de>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Mon, 25 Aug 2014 22:36:45 +0200")
References: <1408999005-15853-1-git-send-email-jkrause@posteo.de>
Message-ID: <87egvyphtz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:

 > Those toolchains use gcc <= 4.3, which do not support required C++11 features.
 > Signed-off-by: J?rg Krause <jkrause@posteo.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
