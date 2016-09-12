From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 12 Sep 2016 07:31:09 -0300
Subject: [Buildroot] [PATCH v2] wandboard: Make explicit that a ext4
 rootfs is used
In-Reply-To: <20160912113837.33be0945@free-electrons.com>
References: <1473633102-7920-1-git-send-email-festevam@gmail.com>
 <20160912113837.33be0945@free-electrons.com>
Message-ID: <CAOMZO5AL15CQkHX+tnX1wAsDCXQtJGGzi9+OmLjS=e7sRYBoeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Sep 12, 2016 at 6:38 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> Applied to master, thanks. However maybe at some point you want to move
> the wandboard to use the generic freescale genimage/post-image script
> that I merged yesterday?

Yes, I will try to move it to the generic genimage/post-image script. Thanks
