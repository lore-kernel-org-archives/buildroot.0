From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 22:16:51 +0100
Subject: [Buildroot] [PATCH 4/5] package/ncurses: trim leading 'lib'
	from definition of libs to install
In-Reply-To: <da5996121c716e1e4c35f27a44446dab642c2734.1418572993.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 14 Dec 2014 17:04:39 +0100")
References: <cover.1418572993.git.yann.morin.1998@free.fr>
 <da5996121c716e1e4c35f27a44446dab642c2734.1418572993.git.yann.morin.1998@free.fr>
Message-ID: <878ui8likc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, ncurses creates symlinks from the non-'w' variants to the
 > equivalent 'w' variant, but forgets to do so for pkg-config files.

 > To be able to share the same list between the libraries and the
 > pkg-config files to symlink, just trim the 'lib' prefix of libraries in
 > the definition, and just add it back at the time we need it.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
