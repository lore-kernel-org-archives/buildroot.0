From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Jun 2014 13:10:57 +0200
Subject: [Buildroot] [PATCH 15/21] package/weston: libxkbcommon is
	optional
In-Reply-To: <a71e7e58835a658675c879f3abe68e1c09aa53d3.1401658972.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 1 Jun 2014 23:43:46 +0200")
References: <cover.1401658972.git.yann.morin.1998@free.fr>
 <a71e7e58835a658675c879f3abe68e1c09aa53d3.1401658972.git.yann.morin.1998@free.fr>
Message-ID: <87ppirwoqm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > It is possible to build weston without libxkbcommon, for example
 > if using an input method that is not an hardware keyboard (e.g. a
 > virtual keyboard, or none at all.)

 > Make it optional.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
