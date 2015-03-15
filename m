From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:37:26 +0100
Subject: [Buildroot] [PATCH] package/czmq: fix discovery of libzmq for
 static build
In-Reply-To: <1426368725-27750-1-git-send-email-romain.naour@openwide.fr>
References: <1426368725-27750-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150315143726.6e9f5777@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 14 Mar 2015 22:32:05 +0100, Romain Naour wrote:
> Backport and rebase a patch from upstream:
> https://github.com/zeromq/czmq/commit/313714f8b73c23d68b1216bc2df3d0ccc6ab1ffd
> 
> Also, remove the fix in czmq.mk for static build.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ec4/ec414b52f9cdd8d7d365283e21479519e63c7d97/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
