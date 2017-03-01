From: Taceant Omnes <taceant@gmail.com>
Date: Wed, 1 Mar 2017 11:53:19 +0000
Subject: [Buildroot] Ethernet not working with imx6ulevk
In-Reply-To: <f974facb-71d8-5498-cfc5-df451a58d27a@mind.be>
References: <CAKkGsYK+WPvgH-SQ9L_cbBkjCOOXK9YE4ty6L5wQDhJOmYR==Q@mail.gmail.com>
 <CAKkGsYLpW+bU-SihBgRFgyi4cmzJhgah1ZDpjQf0m2ksEmKP_A@mail.gmail.com>
 <f974facb-71d8-5498-cfc5-df451a58d27a@mind.be>
Message-ID: <CAKkGsYLnkPh=c2ZU=m2ju04oxvZsX-OT8PaAMtywL65TDvCNzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28 February 2017 at 22:42, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Note that this patch is apparently included in rel_imx_4.1.15_2.0.1_ga. So, can
> you update configs/freescale_imx6ulevk_defconfig to 2.0.1, verify that it works,
> and send a patch to Buildroot?

Hi Arnout,

Just replacing 2.0.0 with 2.0.1 for the kernel and u-boot in the BR
defconfig will not work. I am not an expert neither on BR nor on git,
nevertheless my guess is that it does not work because there is no
rel_imx_4.1.15_2.0.1_ga tag for the kernel nor for u-boot.

http://git.freescale.com/git/cgit.cgi/imx/linux-imx.git/
http://git.freescale.com/git/cgit.cgi/imx/uboot-imx.git/

Cheers.
