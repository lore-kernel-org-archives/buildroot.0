From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Aug 2019 00:12:50 +0200
Subject: [Buildroot] [PATCH 09/13 v2] core: split generated kconfig file
In-Reply-To: <5e1ebdbbc317cee7cc2fbb727589dc4a4ae8d1da.1564431589.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 29 Jul 2019 22:19:59 +0200")
References: <cover.1564431589.git.yann.morin.1998@free.fr>
 <5e1ebdbbc317cee7cc2fbb727589dc4a4ae8d1da.1564431589.git.yann.morin.1998@free.fr>
Message-ID: <87imrd7va5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, the kconfig part contains two things: the kconfig option
 > with the paths to br2-external trees, and the kconfig menus for the
 > br2-external trees.

 > When we want to include more kconfig files from the br2-external tree
 > (e.g. to get definitions for pre-built toolchains), we will need to
 > have the paths defined earlier, so they can be used from the br2-external
 > tree to include files earlier than the existing menus.

 > Split the generated kconfig file in two: one to define the paths, which
 > gets included early in our main Config.in, and one to actually define
 > the existing menus, which still gets included at the same place they
 > currently are.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Vadim Kochan <vadim4j@gmail.com>

 > ---
 > Changes v1 -> v2:
 >   - redirection is changed in its own patch now

Committed, thanks.

-- 
Bye, Peter Korsgaard
