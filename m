From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Sun, 18 Jun 2017 12:51:46 +0530
Subject: [Buildroot] [PATCH v2] board: Add a13_olinuxino Support
In-Reply-To: <1497726908-1702-1-git-send-email-chakra@openedev.com>
References: <1497726908-1702-1-git-send-email-chakra@openedev.com>
Message-ID: <CAD6G_RSt5TXg3AoD5E2OmTBzGCH7nbZh0BbNRg=5vSQ0Hz2Xiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 18, 2017 at 12:45 AM, Chakra Divi <2chakrass@gmail.com> wrote:
> Add initial support for a13_olinuxino board
> with below features
> - U-Boot 2017.05
> - Linux 4.11.5
> - Default packages from buildroot
>
> Signed-off-by: Chakra Divi <chakra@openedev.com>
> ---
> Changes for v2:
> - Add missing readme.txt
>
>  .gitlab-ci.yml                           |    1 +
>  board/olimex/a13_olinuxino/boot.cmd      |    7 +++++
>  board/olimex/a13_olinuxino/genimage.cfg  |   34 +++++++++++++++++++++++
>  board/olimex/a13_olinuxino/post-build.sh |    9 ++++++
>  board/olimex/a13_olinuxino/readme.txt    |   43 +++++++++++++++++++++++++++++
>  configs/olimex_a13_olinuxino_defconfig   |   44 ++++++++++++++++++++++++++++++

DEVELOPERS file?

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
