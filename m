From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jan 2015 23:23:45 +0100
Subject: [Buildroot] [PATCH 3/4] boot/syslinux: disable MinGW support
In-Reply-To: <1421710198-20898-3-git-send-email-romain.naour@openwide.fr>
References: <1421710198-20898-1-git-send-email-romain.naour@openwide.fr>
 <1421710198-20898-3-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150126232345.4fa48205@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 20 Jan 2015 00:29:57 +0100, Romain Naour wrote:
> If MinGW is found on the host, syslinux.exe and syslinux64.exe
> are build. Disable it since there are no MinGW support in
> Buildroot.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  boot/syslinux/0001-disable-MinGW-support.patch | 29 ++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 boot/syslinux/0001-disable-MinGW-support.patch

Hum, why not, but your patch is clearly not upstreamable in Syslinux as
is. Do you think you can instead propose a patch that could potentially
be upstreamed (and submit it upstream) ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
