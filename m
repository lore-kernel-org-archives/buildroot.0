From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Tue, 29 Mar 2011 03:41:28 +0200
Subject: [Buildroot] SCM management
In-Reply-To: <20110316163052.GA8006@game.jcrosoft.org>
References: <20110316163052.GA8006@game.jcrosoft.org>
Message-ID: <20110329014128.GO6466@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

	ping

Best Regards,
J.
On 17:30 Wed 16 Mar     , Jean-Christophe PLAGNIOL-VILLARD wrote:
> Hi,
> 
> 	During my work on barebox and the kernel
> 	I modify Buildroot to get the source from my git or the mainline
> 	and found out that we remove the tree everytime and re-clone it
> 
> 	This is time consuming specialy in develeopment when you add new
> 	commit for other user which need to re-checkout your tree.
> 
> 	So I'd like to propose a new way to manage the trees
> 	we could do something like on gentoo
> 
> 	as example with git
> 	we clone a bare tre and store it in dl and do not remove it so if you
> 	need a new version of the tree you just need to fetch it and do not
> 	clone it again
> 
> 	For this purpose I would propose to manage the tree like this in dl
> 	for git as example
> 	builddir/fetch/git-src/${package}
> 
> 	for bzr
> 	builddir/fetch/bzr-src/${package}
> 
> 	and to simplify the scm I would like to propose the manage it not via
> 	makefile rules but via scripts
> 
> Best Regards,
> J.
