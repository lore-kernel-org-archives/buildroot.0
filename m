From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Mar 2020 16:40:55 +0100
Subject: [Buildroot] [PATCHv2] Makefile: work around a bug in newly
 released make 4.3
In-Reply-To: <20200304134037.24237-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Wed, 4 Mar 2020 14:40:37 +0100")
References: <20200304134037.24237-1-yann.morin.1998@free.fr>
Message-ID: <878skebyig.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Several users of rolling-release distributions have been reporting on
 > IRC that Buildroot is broken now that they have switched to the newly
 > released make 4.3.

 > It turns out that the constructs we use to generated and onclude the
 > internal br2-external related fragments is no longer working with
 > make-4.3.

 > Indeed, an upstream bug report [0] seems to imply that it so far was
 > working by chance. There has been no further feedback, whether this is
 > really considered a fix for a previous ill-defined behaviour, or an
 > actual regression...

 > In the meantime, we add a workaround, suggested in that same bug report,
 > that fixes the issue for make 4.3, and that should not break on older
 > make versions either (verified on all relevant versions: from 3.81,
 > 3.82, 4.0, 4.1, and 4.2).

 > [0] https://savannah.gnu.org/bugs/?57676

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 > ---
 > Changes v1 -> v2:
 >   - [0] points to something now  (Thomas)
 >   - repeat the bug URL in the Makefile  (Thomas)
 >   - explain where the workaround comes from  (Thomas)

Committed, thanks.

-- 
Bye, Peter Korsgaard
