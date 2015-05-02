From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 May 2015 09:01:57 +0200
Subject: [Buildroot] [PATCHv2] doc/manual: fix generating manual after
	legacy overhaul
In-Reply-To: <1430498134-8798-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 1 May 2015 18:35:34 +0200")
References: <1430498134-8798-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87y4l7tqca.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit 53903a15 (*config: improve handling of BR2_LEGACY) added an
 > option to entirely skip legacy entries, by passing a variable in the
 > environment.

 > However, it missed one location where that variable is also needed,
 > which is generating the list of packages and deprecated features for
 > inclusion in the manual.

 > Fix that by re-using the global $(COMMON_CONFIG_ENV) variable,
 > overriding just what we don't want (i.e. br2-external location and
 > defconfig path).

 > Also, slightly re-order variables so the ones we override come right
 > after the common settings, moving the specific ones at the end, one
 > variable per line.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 > ---
 > Changes v1 -> v2:
 >   - only one variable per line  (Arnout)
 >   - typoes  (arnout)

Committed, thanks.

-- 
Bye, Peter Korsgaard
