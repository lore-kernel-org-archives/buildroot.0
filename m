From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Nov 2019 21:46:14 +0100
Subject: [Buildroot] [PATCH] systemd: add option to enable
 systemd-journal-remote
In-Reply-To: <CAJPHfYNGkrW8MWGQyaWgehg_wAQ=3eoNWVZHEh=DyhbebJhJTA@mail.gmail.com>
References: <CAJPHfYNGkrW8MWGQyaWgehg_wAQ=3eoNWVZHEh=DyhbebJhJTA@mail.gmail.com>
Message-ID: <20191127214614.33d87ae0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Jeremy Rosen in Cc, for the systemd expertise.

On Thu, 13 Jun 2019 11:05:27 +0800
Yi Zheng <goodmenzy@gmail.com> wrote:

>     systemd-journal-remote was added in systemd v211, so add a new option
>     to enable or disable it.
> 
>     Signed-off-by: Yi Zheng <goodmenzy@gmail.com>

Unfortunately, this commit seems to break things for some users. We
have a bug report at https://bugs.busybox.net/show_bug.cgi?id=12301.
Could you have a look ?

J?r?my, what do you think ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
