From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Oct 2014 23:18:02 +0200
Subject: [Buildroot] [PATCH] eudev: add input group
In-Reply-To: <1413838745-14008-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413838745-14008-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141020231802.204b1e27@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 20 Oct 2014 17:59:05 -0300, Gustavo Zacarias wrote:
> It's used by 50-default-udev.rules for input-class devices.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/eudev/eudev.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I've seen the same issue a couple of days ago.

Does systemd needs a similar fix?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
