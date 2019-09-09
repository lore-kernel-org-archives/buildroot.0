From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 9 Sep 2019 09:55:24 -0300
Subject: [Buildroot] [PATCH 6/7] configs/freescale_imx8qmmek: new
 defconfig
In-Reply-To: <20190909090402.11736-6-maeva.manuel@nxp.com>
References: <20190909090402.11736-1-maeva.manuel@nxp.com>
 <20190909090402.11736-6-maeva.manuel@nxp.com>
Message-ID: <CAOMZO5D8_NqY-4XEj4bGQOkcj6ZE+hqJOa3kEDeP3JYCba7q-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maeva,

On Mon, Sep 9, 2019 at 6:03 AM Maeva Manuel <maeva.manuel@nxp.com> wrote:

> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="ssh://git at bitbucket.sw.nxp.com/imx/linux-imx.git"

Please use an external link such as codeaurora repo.

> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.14.78_1.0.0_ga"

This is a bit old now. What about using imx_4.19.35_1.0.0 instead?
