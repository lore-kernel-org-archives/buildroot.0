From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 21:35:54 +0100
Subject: [Buildroot] [PATCH 1/1] Declare SED Makefile instead of
 package/Makefile.in so it exists globally.
In-Reply-To: <1455635726-22028-1-git-send-email-alvaro.gamez@hazent.com>
References: <20160216161010.779981bb@free-electrons.com>
 <1455635726-22028-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20160216213554.60f53246@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The title is too long, it should be:

	Makefile: declare SED globally

or something like that.

On Tue, 16 Feb 2016 16:15:26 +0100, Alvaro G. M wrote:
> In particular, this allows the use of buildroot-submodule and in general,
> any use of buildroot from out of tree.

This commit log should be improved, because:

 1/ Why should we care about buildroot-submodule, and if we care, what
    is the actual problem ?

 2/ What do you mean by "use Buildroot from out of tree" ? I do out of
    tree builds every day and it works just fine. So this aspect needs
    to be detailed.

I have nothing against the change, which is fairly simple, but it needs
to be justified properly.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
