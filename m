From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Jan 2014 21:29:48 +0100
Subject: [Buildroot] [PATCH 5/5] manual: add section about dealing
	efficiently with big image files
In-Reply-To: <976b993986ff075f38067792121ac0a443cd6369.1389134731.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 7 Jan 2014 23:46:08 +0100")
References: <cover.1389134731.git.yann.morin.1998@free.fr>
 <976b993986ff075f38067792121ac0a443cd6369.1389134731.git.yann.morin.1998@free.fr>
Message-ID: <87vbxsaog3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > As reported by Ryan, it is not well-known that most tools can deal
 > efficiently with big sparse files.

 > Add a section in the manual about this, with tar and cp used as
 > examples, and a hinting to the man pages for the others.

 > Reported-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>
 > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

 > ---
 > changes v2 -> v3:
 >   - fix typo  (Thomas DS)
 >   - better phrasing to direct the reader to the man pages  (Thomas DS)

Committed, thanks.

-- 
Bye, Peter Korsgaard
