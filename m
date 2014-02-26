From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Feb 2014 21:36:22 +0100
Subject: [Buildroot] [PATCH v2] package/ti-gfx: number and fix the
	new-clk-api patch
In-Reply-To: <1393440194-32641-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 26 Feb 2014 19:43:14 +0100")
References: <1393440194-32641-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <8761o1ehmh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Add a sequence number to the newclkapi patch.
 > Rebase it ontop of the 5.01.00.01 release.

 > Note: this is barely tested. It applies neatly, but I can't test it,
 > since I do not have the hardware. I bumped the patch by basically
 > renaming the problematic functions like the previous patch did:
 >     s/clk_enable/clk_prepare_enable/
 >     s/clk_disable/clk_disable_unprepare/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Spenser Gilliland <spenser@gillilanding.com>
 > ---
 > Changes v1 -> v2:
 >   - actually renumber the patch


Committed to next, thanks.

-- 
Bye, Peter Korsgaard
