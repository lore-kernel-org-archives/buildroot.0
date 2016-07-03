From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:29:06 +0200
Subject: [Buildroot] [PATCH 69/69] tar: remove empty host dependencies
 definition
In-Reply-To: <1467498098-23731-70-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
 <1467498098-23731-70-git-send-email-julien.floret@6wind.com>
Message-ID: <20160703102906.38f40567@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jul 2016 00:21:38 +0200, Julien Floret wrote:
> Note that host-tar dependencies were broken with automatic derivation
> of host dependencies:
> host-tar could depend (or not) on host-attr (and even on non-existing
> host-acl!), depending on BR2_PACKAGE_BUSYBOX.
> 
> Now, host-tar has no dependency.
> 
> Signed-off-by: Julien Floret <julien.floret@6wind.com>
> ---
>  package/tar/tar.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
