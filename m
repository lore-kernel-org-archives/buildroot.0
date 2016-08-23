From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 14:58:42 +0200
Subject: [Buildroot] [PATCH v5 2/7] pkg-download: Allow packages to pass
 generic options to download methods
In-Reply-To: <20160823121950.16826-3-romain.perier@free-electrons.com>
References: <20160823121950.16826-1-romain.perier@free-electrons.com>
 <20160823121950.16826-3-romain.perier@free-electrons.com>
Message-ID: <20160823145842.51e9a714@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 14:19:45 +0200, Romain Perier wrote:
> Introduce a new package variable $(PKG)_DL_OPTS. When this variable
> is defined, its value is passed to the downloader as options to
> the underlying command. Packages can now retrieve archives from server
> expecting logins and passwords, use referer url, proxy or specific
> options for cloning a repository.
> 
> Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
