From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 12 Oct 2019 09:41:10 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-10-11
In-Reply-To: <5da16fea.1c69fb81.4eda5.4f71SMTPIN_ADDED_MISSING@mx.google.com>
References: <5da16fea.1c69fb81.4eda5.4f71SMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <CAOMZO5DO4yqN82QVpui-17S=trtW=tbBk7h5fJPBXO__fTe0Sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Oct 12, 2019 at 3:17 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> Build failures related to your defconfigs:
>
>                         defconfig |                        link to the job
> ----------------------------------+--------------------------------------------------------------
>                    imx6-sabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/318105190

The failure is:

/bin/sh: 1: lzop: not found

So you need to install lzop package in the host PC.

Regards,

Fabio Estevam
