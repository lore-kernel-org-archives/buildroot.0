From: Vadym Kochan <vadim4j@gmail.com>
Date: Fri, 1 Feb 2019 18:44:16 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-01-31
In-Reply-To: <20190201070043.7B3BD86A10@fraxinus.osuosl.org>
References: <20190201070043.7B3BD86A10@fraxinus.osuosl.org>
Message-ID: <20190201164416.GA23751@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Feb 01, 2019 at 07:00:43AM +0000, Thomas Petazzoni wrote:
> Hello,
> 
> Build statistics for 2019-01-31
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  22 |   1 |   0 |  23 |
>    2018.11.x |  22 |   2 |   0 |  24 |
>       master | 171 |  20 |   0 | 191 |
> 
> Results for branch '2018.02.x'
> ==============================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                  mesa3d-17.3.6 | 1 
> 
> 
> Detail of failures
> ------------------
> 
>      powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/fb5956fd009245abff378ce83b206d3dacc425a5 |     
> 
> Results for branch '2018.11.x'
> ==============================
> 
> Classification of failures by reason
> ------------------------------------
> 
>   libnetfilter_cttimeout-1.0.0 | 1 
>           synergy-v2.0.12-beta | 1 
> 
> 
> Detail of failures
> ------------------
> 
>          arm |   libnetfilter_cttimeout-1.0.0 | NOK | http://autobuild.buildroot.net/results/137cf1adc81c414454ee56cc4609631ca90b7e2f | ORPH
>          arm |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/55bff09b4d802eee927faf796bf7516a45d88ff1 |     
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>    libtorrent-rasterbar-1.1.11 | 3 
>                curlftpfs-0.9.2 | 2 
>                  gnu-efi-3.0.9 | 2 
>             sunxi-tools-v1.4.1 | 2 
>                 civetweb-v1.11 | 1 
>                  expect-5.45.3 | 1 
>                   ffmpeg-3.4.5 | 1 
>                   libnfc-1.7.1 | 1 
>                      lua-5.3.5 | 1 
>                    netsurf-3.8 | 1 
>                  openssh-7.9p1 | 1 
>            python-numpy-1.15.1 | 1 
>                 snort-2.9.11.1 | 1 
>              stress-ng-0.09.47 | 1 
> zbar-b3b4e32b55f570372fc3af... | 1 
> 
> 
> Detail of failures
> ------------------
> 
>      riscv32 |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/a5717271beb98b8877f015f021f747228f87c8a7 |     
>      riscv32 |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/258dc2a1031bc3c5748fe8ceeeaa693e5862d047 |     
>      riscv32 |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/9f524cfe3c15a5af6f0e1134a696f37a783e32df |     
>         i686 |                  expect-5.45.3 | NOK | http://autobuild.buildroot.net/results/bc7d2db4384748ee5b10db762d6a128b348c2f2e | ORPH
>     mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/c66100a4249bd534992ccaff23ec72a41acb0b38 |     
>          arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/ac1d619908fa1dfbbf1b5820325e2b6b007a3442 |     
>   aarch64_be |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/d9c7a5704d1e785024312e3175eeda315b0b199c |     
>      riscv32 |                   libnfc-1.7.1 | NOK | http://autobuild.buildroot.net/results/391d479607449802ff1309f4593453efa55f3d63 |     
>       xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/086a9843b3f72cc687d1afc1e55afaf93977b360 |     
>         or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/0de753b47422c22ae4dc7390eab931565b0457d3 |     
>       xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/3495443d10afd2e9035a0814872b049a7a7fa709 |     
>      riscv32 |                      lua-5.3.5 | NOK | http://autobuild.buildroot.net/results/a2f587f8cb1263856976d80b59f59c2a9545099c |     
>          arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/af793e7f2bff8dab48a57f707d2c518c08ba3f91 |     
>      riscv32 |                  openssh-7.9p1 | NOK | http://autobuild.buildroot.net/results/d0a5863165c94e53d29ade0ef39a89e47db97df9 | ORPH
>          arm |            python-numpy-1.15.1 | NOK | http://autobuild.buildroot.net/results/7842e02cce8523827d58a01aff8f573085f21752 |     
>      aarch64 |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/c22409b05e9037c42fe08dad682bee84e8928139 |     
>         or1k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/acea43e448755c4f81b602636ae8ca33a533fc02 |     

The following patch fixes the stress-ng build issue:

	https://patchwork.ozlabs.org/patch/1019775/

Regards,
Vadim Kochan
