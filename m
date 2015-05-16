From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 15:15:11 +0200
Subject: [Buildroot] [PATCH] package/ipmiutil: really force md2 off
In-Reply-To: <1431731188-23565-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Sat, 16 May 2015 01:06:28 +0200")
References: <1431731188-23565-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87a8x4br4w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > If ALLOW_GNU is not defined, SKIP_MD2 is a nop.
 > Fixes:
 > http://autobuild.buildroot.net/results/f606ec1fff4cea257a4c6274bc5603efdfc439ad/

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
