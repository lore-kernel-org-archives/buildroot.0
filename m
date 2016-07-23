From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 15:09:59 +0200
Subject: [Buildroot] [PATCH 1/2] package/efl: enable systemd support
In-Reply-To: <1469226198-26474-1-git-send-email-romain.naour@gmail.com>
References: <1469226198-26474-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160723150959.79df0475@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jul 2016 00:23:17 +0200, Romain Naour wrote:
> systemd it one of the "highly recommended" dependecies according to the
> README [1] but disabling it doesn't need the
> --enable-i-really-know-what-i-am-doing... option.
> 
> That's why BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG is not disabled when
> systemd is not selected.
> 
> [1] https://git.enlightenment.org/core/efl.git/tree/README?h=efl-1.17#n489
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> Tested with Qemu for x86_64 target with systemd + X11 server
> ---
>  package/efl/efl.mk | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
