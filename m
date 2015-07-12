From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 00:27:38 +0200
Subject: [Buildroot] [PATCH 04/16] package/systemd: add missing
 dependencies
In-Reply-To: <1421684056-5266-5-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-5-git-send-email-maxtram95@gmail.com>
Message-ID: <20150713002738.450809fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxim Mikityanskiy,

On Mon, 19 Jan 2015 18:14:04 +0200, Maxim Mikityanskiy wrote:
> Systemd depends on mount and nologin from util-linux. Mount from busybox
> is not fine, because its behavior differs from util-linux mount. Busybox
> mount does not handle correctly 'mount / -o remount' (should apply
> options from /etc/fstab). Nologin should be present, because
> systemd-sysusers uses it as shell for newly created system users.
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> ---
>  package/systemd/Config.in | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
