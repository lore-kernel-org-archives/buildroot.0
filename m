From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 18:35:24 +0200
Subject: [Buildroot] [PATCH] Makefile: use $(Q) instead of @ to silence
 target-finalize commands
In-Reply-To: <20200829125638.15424-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 29 Aug 2020 14:56:38 +0200")
References: <20200829125638.15424-1-yann.morin.1998@free.fr>
Message-ID: <875z91if5f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > As 18f6c26118 just did to silence the file lists commands, switch to
 > using $(Q) instead of a plain @, to silence the commands.

 > Using $(Q) will allow to debug the commands with V=1.

 > We keep @ for the calls to MESSAGE, though.

 > The commadns that are not currently silenced are left as-is, and they
 > can be converted to being silent in a followup patch, if need be,

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
