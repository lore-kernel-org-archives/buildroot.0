From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 2 Feb 2015 15:22:48 +0100
Subject: [Buildroot] [PATCH 04/16] package/systemd: add missing
	dependencies
In-Reply-To: <1421684056-5266-5-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-5-git-send-email-maxtram95@gmail.com>
Message-ID: <CAHXCMMKVvckGfC=KOKe9ay1CXTU+CyX1SaY2yaeTQ_Y3uQ+QRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 19, 2015 at 5:14 PM, Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
> Systemd depends on mount and nologin from util-linux. Mount from busybox
> is not fine, because its behavior differs from util-linux mount. Busybox
> mount does not handle correctly 'mount / -o remount' (should apply
> options from /etc/fstab). Nologin should be present, because
> systemd-sysusers uses it as shell for newly created system users.
>
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
