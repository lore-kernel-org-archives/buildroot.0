From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 16:09:05 +0200
Subject: [Buildroot] [PATCH] qemu: allow to build statically
In-Reply-To: <20161109100305.6261-1-jezz@sysmic.org>
References: <20161109100305.6261-1-jezz@sysmic.org>
Message-ID: <20170401160905.2bd86dcb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Nov 2016 11:03:05 +0100, J?r?me Pouiller wrote:
> Compiling Qemu statically allows to use it to chroot into target/. It is a
> nice feature, so add an option for it.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/qemu/Config.in.host | 26 ++++++++++++++++++++++++++
>  package/qemu/qemu.mk        |  4 ++++
>  2 files changed, 30 insertions(+)

Applied to master after tweaking a bit the Config.in help text. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
