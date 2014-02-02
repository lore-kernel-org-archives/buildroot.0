From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Feb 2014 10:28:20 +0100
Subject: [Buildroot] [PATCH 1/3] infozip: fix $(AS) behavior
In-Reply-To: <1391120098-8325-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Thu, 30 Jan 2014 23:14:58 +0100")
References: <1391120098-8325-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87y51trhhn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > infozip's Makefile expect $(AS) to output by default to <basename>.o
 > but when called from Buildroot, the value for $(AS) is set
 > to to invoke the toolchain's $(AS) directly, and the output of it
 > goes to a.out.

 > So, define $(AS) with $(CC -c)

 > Reported-by: ?????? ??????? <lucenko_kirill@mail.ru>
 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
