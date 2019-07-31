From: Julien Boibessot <julien.boibessot@free.fr>
Date: Wed, 31 Jul 2019 09:09:55 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-07-30
In-Reply-To: <20190731060047.74A0986802@whitealder.osuosl.org>
References: <20190731060047.74A0986802@whitealder.osuosl.org>
Message-ID: <fafde29b-0f43-e53e-d0df-37f10302ab95@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 31/07/2019 08:00, Thomas Petazzoni wrote:
> Hello,
>
> Build statistics for 2019-07-30
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>    2019.02.x |  11 |   0 |   0 |  11 |
>    2019.05.x |  10 |   0 |   0 |  10 |
>       master |  65 |  33 |   0 |  98 |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>                 host-mtd-2.1.1 | 6 
>
>          arm |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/727e2b6bd4c5bf4dcb886c9ae63b293251a1d3be |     
>         m68k |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/8b507d6deafe69c59597a99863df46c8c6888288 |     
>         i586 |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/e459400a3f50fd5c24165802fe1effe4de6c2932 |     
>      nds32le |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/85b64c71f20eb11fa3e215c6d4b9eee07ecc6a25 |     
>          arc |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/480fcb2ad263aabc08c463eaebaf9e33934c3b72 |     
>   aarch64_be |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/cb7ba2e5ee1ba33ff613bfc73612af6d29fe8066 |     
>    

will be fixed with my recent patch:
    https://patchwork.ozlabs.org/patch/1138333/

Regards,
Julien
