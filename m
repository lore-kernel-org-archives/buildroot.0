From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 4 Mar 2018 15:05:08 -0300
Subject: [Buildroot] [PATCH v4 0/4] Initial support for NXP iMX8
 (imx8mq-evk)
In-Reply-To: <1520065060-20046-1-git-send-email-karl.erik.larsson@gmail.com>
References: <1520065060-20046-1-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <CAOMZO5Cgd_p7W_A8Oa+fmKKJ2ZpDou+A4e1BBxsjjA4ceuiXcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erik,

On Sat, Mar 3, 2018 at 5:17 AM, Erik Larsson
<karl.erik.larsson@gmail.com> wrote:
> This series provides initial support for NXP iMX8 (imx8mq-evk).
>
> This series of patches are tested against NXP imx8mq-evk.
> It only handles basic support for iIMX8M, currently no
> support for GPU, VPU and other HW features. This series
> makes it possible to build a minimal system for imx8mq-evk.

Thanks for working on this series.

In case you need to respin it, please add a readme.txt file so that
people can know how to build and flash a SD card to boot this board.

An example of a readme.txt: board/freescale/imx51evk/readme.txt

Thanks
