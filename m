From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 12 Oct 2019 18:14:45 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-10-11
In-Reply-To: <20191012145031.42d7cd69@windsurf>
References: <5da16fea.1c69fb81.4eda5.4f71SMTPIN_ADDED_MISSING@mx.google.com>
 <CAOMZO5DO4yqN82QVpui-17S=trtW=tbBk7h5fJPBXO__fTe0Sw@mail.gmail.com>
 <20191012145031.42d7cd69@windsurf>
Message-ID: <CAOMZO5De=+zGVkicFfzPY2M5wTSuNvHEFOObYsasds8tTxMN2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Oct 12, 2019 at 9:50 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> > /bin/sh: 1: lzop: not found
> >
> > So you need to install lzop package in the host PC.
>
> No, you need to enable BR2_TARGET_UBOOT_NEEDS_LZOP in your defconfig.

Thanks, I was not aware of this option. Will send a patch adding it.

Thanks
