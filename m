From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 22:14:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/dtc: qemu system build need
 libfdt.
In-Reply-To: <1509624873-16240-1-git-send-email-ren_guo@c-sky.com>
References: <1509624873-16240-1-git-send-email-ren_guo@c-sky.com>
Message-ID: <20171102221444.640d928d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Nov 2017 20:14:33 +0800, Guo Ren wrote:
> The "install-bin" just install dtc's programs to host/bin without
> libfdt, but qemu system compile need libfdt.
> 
> see: https://gitlab.com/c-sky/buildroot/-/jobs/38654503
> 
> So we need install libfdt to satisfy qemu system compile.
> 
> Change-Id: I85748479ac11e1c6452d3f79d04f02666218774a
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> ---
>  package/dtc/dtc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, after minor commit log tweaks.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
