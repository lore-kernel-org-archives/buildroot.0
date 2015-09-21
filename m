From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 21 Sep 2015 21:30:23 +0200
Subject: [Buildroot] [PATCH] pkg-cmake: change sed expression delimiter
In-Reply-To: <1442861856-31321-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1442861856-31321-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <CAHXCMMKTE9JigRxwvPKz-GHSoOrK4Q-bF2+gADui3bj6HOe06g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 21, 2015 at 8:57 PM,  <gustavo.zacarias@free-electrons.com> wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
>
> Switch from : to # since CFLAGS can include :'s spilled in from
> BR2_TARGET_OPTIMIZATION, for example:
>
> BR2_TARGET_OPTIMIZATION="-Wl,-rpath,/lib:/usr/lib" would cause the sed
> expression to fail thus breaking the build.
>
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
