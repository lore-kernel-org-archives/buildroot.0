From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 29 Jan 2013 17:27:40 +0100
Subject: [Buildroot] [PATCH 5/5] docs/manual: slightly reword the
 solutions to customize rootfs
In-Reply-To: <1358363393-29977-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358363393-29977-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358363393-29977-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5107F87C.1020502@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> The order of the solutions to customize the root filesystem is
> changed: we now mention the post-build script mechanism *before* the
> custom root filesystem skeleton mechanism, because the former is
> preferred over the latter.
>
> In addition to this, we give a few more details about direct
> customization of the root filesystem in output/target, and about the
> custom target skeleton solution.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
