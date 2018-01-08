From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 Jan 2018 22:48:01 +0100
Subject: [Buildroot] [PATCH 1/2 v2] matchbox-lib: fix dependencies
In-Reply-To: <e3786800a171331ae1ffe69c1fcda35ca833a1c6.1514045682.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 23 Dec 2017 17:15:39 +0100")
References: <cover.1514045682.git.yann.morin.1998@free.fr>
 <e3786800a171331ae1ffe69c1fcda35ca833a1c6.1514045682.git.yann.morin.1998@free.fr>
Message-ID: <87373gqay6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > matchbox-lib build-depends on xlib_libXext, but forgets to select it.
 > It also build-depends on expat without selecting it, but it does need
 > it.

 > Fix that: select xlib_libXext, remove expat.

 > Add myself to developpers for matchbox packages.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

 > ---
 > Changes v1 -> v2:
 >   - drop the expat dependency  (Arnout)

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
