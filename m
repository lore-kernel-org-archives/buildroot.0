From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Dec 2013 12:20:03 +0100
Subject: [Buildroot] [PATCH 1/2] docs/manual: limit the depth of the TOC
	in the HTML output
In-Reply-To: <e2932a94718affcd5ec7dd1c4cbb4cb8c140340c.1386017298.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 2 Dec 2013 21:49:27 +0100")
References: <cover.1386017298.git.yann.morin.1998@free.fr>
 <e2932a94718affcd5ec7dd1c4cbb4cb8c140340c.1386017298.git.yann.morin.1998@free.fr>
Message-ID: <87d2lenpuk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > The current TOC level is set to 4, which does not mean 'a 4-level deep TOC',
 > but really means 'a TOC deep to the 4th level', with the first level being
 > level 0, which means we have:

 >     12. Appendix
 >         12.1. Makedev syntax documentation
 >         12.2. Makeuser syntax documentation
 >         12.3. Partition table layout description syntax
 >             12.3.1. The global section
 >                 Properties for the global section

 > Which a bit too much. And yet, the fifth level is not shown, since we
 > don't have any! :-/

 > Limit the depth of the TOC to three levels, which is just enough to be
 > usefull, yet not cluttered by low-level titles.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
