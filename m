From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 21:40:07 +0200
Subject: [Buildroot] [PATCH] systemd: add option to enable
 systemd-journal-remote
In-Reply-To: <CAJPHfYNGkrW8MWGQyaWgehg_wAQ=3eoNWVZHEh=DyhbebJhJTA@mail.gmail.com>
References: <CAJPHfYNGkrW8MWGQyaWgehg_wAQ=3eoNWVZHEh=DyhbebJhJTA@mail.gmail.com>
Message-ID: <20190617214007.537f8ac6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yi,

On Thu, 13 Jun 2019 11:05:27 +0800
Yi Zheng <goodmenzy@gmail.com> wrote:

>     systemd-journal-remote was added in systemd v211, so add a new option
>     to enable or disable it.
> 
>     Signed-off-by: Yi Zheng <goodmenzy@gmail.com>
> ---
>  package/systemd/Config.in  | 15 +++++++++++++++
>  package/systemd/systemd.mk |  4 ++++
>  2 files changed, 19 insertions(+)

I have fixed the various issues pointed by Yann (formatting issues in
the commit log and Config.in file, missing "else" condition to
explicitly disable the option), and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
