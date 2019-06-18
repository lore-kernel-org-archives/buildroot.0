From: Yi Zheng <goodmenzy@gmail.com>
Date: Tue, 18 Jun 2019 15:05:10 +0800
Subject: [Buildroot] [PATCH] systemd: add option to enable
 systemd-journal-remote
In-Reply-To: <20190617214007.537f8ac6@windsurf>
References: <CAJPHfYNGkrW8MWGQyaWgehg_wAQ=3eoNWVZHEh=DyhbebJhJTA@mail.gmail.com>
 <20190617214007.537f8ac6@windsurf>
Message-ID: <CAJPHfYOb4mHgw_CWZXm6jhRGO+zAbBPNPCrHs1m7MRkmVJ=e4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks a lot!
It is very hard for me to use gmail.
VPS linkage is not stable in China.

Thanks for your kindness to fixup that patch to fulfill the coding standards.

Thomas Petazzoni <thomas.petazzoni@bootlin.com> ?2019?6?18??? ??3:40???
>
> Hello Yi,
>
> On Thu, 13 Jun 2019 11:05:27 +0800
> Yi Zheng <goodmenzy@gmail.com> wrote:
>
> >     systemd-journal-remote was added in systemd v211, so add a new option
> >     to enable or disable it.
> >
> >     Signed-off-by: Yi Zheng <goodmenzy@gmail.com>
> > ---
> >  package/systemd/Config.in  | 15 +++++++++++++++
> >  package/systemd/systemd.mk |  4 ++++
> >  2 files changed, 19 insertions(+)
>
> I have fixed the various issues pointed by Yann (formatting issues in
> the commit log and Config.in file, missing "else" condition to
> explicitly disable the option), and applied to master. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
