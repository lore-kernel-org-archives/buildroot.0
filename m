From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:11:27 +0200
Subject: [Buildroot] [PATCH] package/luaposix: add .hash file
In-Reply-To: <1466113180-20892-1-git-send-email-romain.naour@gmail.com>
References: <1466113180-20892-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160618151127.338b191b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 23:39:40 +0200, Romain Naour wrote:
> Similar to jquery-keyboard, it seems the luaposix tarball on the autobuilder is
> corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o mirror.
> 
> Fixes:
> http://autobuild.buildroot.net/results/426/426f85021498611e43cdc2af693099b0687de52c
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/luaposix/luaposix.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/luaposix/luaposix.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
