From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 May 2020 23:17:05 +0200
Subject: [Buildroot] [PATCH 1/2] package/libcap-ng: add host variant
In-Reply-To: <20200502135205.1084120-1-romain.naour@gmail.com>
References: <20200502135205.1084120-1-romain.naour@gmail.com>
Message-ID: <20200531231705.6f1603cd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  2 May 2020 15:52:04 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Qemu 5.0.0 recently switched to libcap-ng [1].
> Add the host variant for host-qemu package.
> 
> [1] https://git.qemu.org/?p=qemu.git;a=commit;h=7e46261368d129c5ee8be927f5bcadc7ecd800d7
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/libcap-ng/libcap-ng.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Both patches applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
