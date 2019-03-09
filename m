From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 9 Mar 2019 11:06:07 -0300
Subject: [Buildroot] QT 5.6 app with eglfs and etnaviv (imx6 solo,
 buildroot 2018.02.5)
In-Reply-To: <CAE58QoNKbu=B6KR_X=rbzbi5Mf+POGsT9k8CZgX70DWQn+Jmmg@mail.gmail.com>
References: <CAE58QoMfF2Kwi0Hc_yOeOinoLA-82OfzzeymOBXsjMK=nYoK5g@mail.gmail.com>
 <20190308235223.62e76a71@gmx.net>
 <CAOMZO5DYCL3ENfoc8tYdNs3XFAurTaoe5Y8ho2CDB2+iYX2zQA@mail.gmail.com>
 <CAE58QoNKbu=B6KR_X=rbzbi5Mf+POGsT9k8CZgX70DWQn+Jmmg@mail.gmail.com>
Message-ID: <CAOMZO5DErRhb1gaZvRjOgtpxKsXMpBb4JSWRHnsEV=McTEfpnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Juan,

On Fri, Mar 8, 2019 at 8:42 PM Juan A. Rubio <jarubio2001@gmail.com> wrote:
>
> Peter, Fabio,
>
> Thanks, I did realize that I was missing the QT_QPA_EGLFS_KMS_CONFIG.
> After passing the json file, the application started to work, although
> I believe with software rendering (QSGRenderThread is using 100% of
> CPU). It looks like the etnaviv driver is not being loaded but I think
> that is something I need to check in my kernel.

From a kernel perspective all you need is a modern kernel and to
select imx_v6_v7_defconfig.

You could try running something simpler like kmscube first.
