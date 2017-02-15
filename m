From: Breno Matheus Lima <brenomatheus@gmail.com>
Date: Wed, 15 Feb 2017 11:15:29 -0200
Subject: [Buildroot] [PATCH] udoo/neo: Pass the rootfs offset
In-Reply-To: <1487161656-15772-1-git-send-email-fabio.estevam@nxp.com>
References: <1487161656-15772-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <CAC4tdFVo=EHpmaZXXiNDwrKJEPZPWfsY=CJh_OhjLfzH+HnkYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

2017-02-15 10:27 GMT-02:00 Fabio Estevam <fabio.estevam@nxp.com>:
> When manually writing SPL and u-boot.img to the SD card the rootfs
> gets corrupted.
>
> Fix this issue by passing a 1MB offset for the rootfs.
>
> Reported-by: Breno Lima <breno.lima@nxp.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Tested-by: Breno Lima <breno.lima@nxp.com>

Thanks
-- 
Breno Matheus Lima
