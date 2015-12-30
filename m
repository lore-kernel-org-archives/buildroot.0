From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Dec 2015 20:10:42 +0100
Subject: [Buildroot] [git commit] package/tcl: move comment around,
	to keep proper indentation
In-Reply-To: <20151228165835.08B517F8EB@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 28 Dec 2015 17:58:01 +0100")
References: <20151228165835.08B517F8EB@busybox.osuosl.org>
Message-ID: <877fjv21n1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

> commit: http://git.buildroot.net/buildroot/commit/?id=ac371770de69b5ee5f15eed7dd790558b8835d7d
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

> In Kconfig, when there is an item (like a comment) between a symbol and
> its dependees, then the indentation is not in effect.

> Move the symbol to the top of the file to guarantee the indentation in
> menuconfig.

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thomas, it seems like you forgot to use the -s option to git am, please
try to remember.

-- 
Bye, Peter Korsgaard
