From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 30 Jun 2015 06:23:26 +0300
Subject: [Buildroot] [PATCH v2] configs/acmesystems_aria_g25: new configs
In-Reply-To: <1435613937-20746-1-git-send-email-gustavo@zacarias.com.ar>
References: <1435613937-20746-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150630032326.GV3250@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Mon, Jun 29, 2015 at 06:38:57PM -0300, Gustavo Zacarias wrote:
> Add new basic configurations for ACME Systems ARIA G25 SOM.
> There are two different variants, a 128MB and a 256MB RAM model.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../aria-g25/at91bootstrap_aria_g25_128mb.config   |  9 ++++
>  .../aria-g25/at91bootstrap_aria_g25_256mb.config   |  9 ++++
>  board/acmesystems/aria-g25/readme.txt              | 48 ++++++++++++++++++++++
>  configs/acmesystems_aria_g25_128mb_defconfig       | 24 +++++++++++
>  configs/acmesystems_aria_g25_256mb_defconfig       | 24 +++++++++++
>  5 files changed, 114 insertions(+)
>  create mode 100644 board/acmesystems/aria-g25/at91bootstrap_aria_g25_128mb.config
>  create mode 100644 board/acmesystems/aria-g25/at91bootstrap_aria_g25_256mb.config
>  create mode 100644 board/acmesystems/aria-g25/readme.txt
>  create mode 100644 configs/acmesystems_aria_g25_128mb_defconfig
>  create mode 100644 configs/acmesystems_aria_g25_256mb_defconfig

[snip]

> +Build instructions
> +==================
> +
> +As a regular user configure and then build:
> +
> +$ make acmesystems_aria_g25_defconfig

No such defconfig anymore.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
