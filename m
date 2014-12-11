From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 19:51:07 +0100
Subject: [Buildroot] [PATCH] systemd: bump version to v218
In-Reply-To: <1418300252-3117-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1418300252-3117-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141211195107.4afe5dfb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 11 Dec 2014 12:17:32 +0000, Vicente Olivert Riera wrote:
> Trivial changes:
> - Bump version to v218
> - Update the hash file
> 
> Non-trivial changes:
> - Remove upstreamed patch
> 
>   The patch was added by this upstream commit:
>   http://cgit.freedesktop.org/systemd/systemd/commit/?id=e6c019026b8cfd27a997e6e6ed1349f8f289b7e2
> 
> - Remove non-existent configure options
> 
>   --with-firmware-path option was removed by this upstream commit:
>   http://cgit.freedesktop.org/systemd/systemd/commit/?id=be2ea723b1d023b3d385d3b791ee4607cbfb20ca
> 
>   --disable-tcpwrap option was removed by this upstream commit:
>   http://cgit.freedesktop.org/systemd/systemd/commit/?id=7f8aa67131cfc03ddcbd31c0420754864fc122f0
> 
> - Select a required dependency
> 
>   libmount dependency was added by this upstream commit:
>   http://cgit.freedesktop.org/systemd/systemd/commit/?id=8d3ae2bd4c9bf9fc2e57f7b3776325a1c750ca30
> 
>   The error for not satisfying this required dependency looks like this:
> 
>   checking for MOUNT... no
>   configure: error: *** libmount support required but libraries not
>     found

Thanks a *lot* for writing such a detailed commit log, that justifies
the various changes done to the package. This is very useful, so thanks
for doing it.

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
