From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2016 22:05:03 +0200
Subject: [Buildroot] [PATCH 6/6 v2] e2fsprogs: bump version to 1.43.2
In-Reply-To: <1473087114-12026-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1473087114-12026-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160905220503.573605bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 5 Sep 2016 15:51:54 +0100, Vicente Olivert Riera wrote:
> - Upstream patches removed.
> - Do not autoreconf since this was neecessary for one of those patches
>   that are now upstream. Also remove host-gettext dependency for the
>   same reason.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2:
>  - Remove autoreconf and host-gettext dependency. (Baruch)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
