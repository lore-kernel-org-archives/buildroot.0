From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 19:56:37 +0200
Subject: [Buildroot] [PATCH v2] utils/diffconfig: remove BR2_* prefix
 restriction
In-Reply-To: <20181021162110.10569-1-luca@lucaceresoli.net> (Luca Ceresoli's
 message of "Sun, 21 Oct 2018 17:21:10 +0100")
References: <20181021162110.10569-1-luca@lucaceresoli.net>
Message-ID: <8736sz5gkq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > From: Marcel Patzlaff <m.patzlaff@pilz.de>
 > The utils/diffconfig script works only on variables with the BR2_
 > prefix. This is OK for Buildroot [def]configs since this is the prefix
 > for all user-facing variables, but it prevents using the same script
 > to compare configs from kconfig-based packages.

 > Remove the BR2_ restriction, allowing usage such as:

 >   ./utils/diffconfig \
 > 	board/qemu/xtensa-lx60/linux.config \
 > 	board/qemu/xtensa-lx60/linux-nommu.config

 > Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
 > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

 > ---

 > Changes v1 -> v2:
 >  - rewrite commit message with a different motivation
 >  - fix subject (use imperative verb, lowercase after colon)

Committed, thanks.

-- 
Bye, Peter Korsgaard
