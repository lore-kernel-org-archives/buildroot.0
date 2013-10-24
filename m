From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 24 Oct 2013 14:59:53 -0300
Subject: [Buildroot] [PATCH] Added initial support for Freescale i.mx6
 sabreauto board
In-Reply-To: <BLU0-SMTP3860F7C844E630CB0FCC659F70C0@phx.gbl>
References: <BLU0-SMTP3860F7C844E630CB0FCC659F70C0@phx.gbl>
Message-ID: <52696019.5000705@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/24/2013 02:28 PM, Abdul Hussain wrote:

> Signed-off-by: Abdul Hussain <hussain.abdul@outlook.com>
> ---
>  configs/imx6qsabreauto_defconfig | 1132 ++++++++++++++++++++++++++++++++++++++
>  system/device_table_dev.txt      |    2 +-
>  2 files changed, 1133 insertions(+), 1 deletion(-)
>  create mode 100644 configs/imx6qsabreauto_defconfig

Hi.
1132 lines? How about using "make savedefconfig" ?
It'll generate a quite smaller config file that is just as good
(actually better) than a full-fledged one.
Also it would be great if you could split the device_table_dev
modification into a small separate patch that tells why it's required.
Thanks.
Regards.
