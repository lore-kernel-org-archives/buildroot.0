From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 28 Apr 2017 11:44:33 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-04-27
In-Reply-To: <20170428062842.1E44E20E06@mail.free-electrons.com>
References: <20170428062842.1E44E20E06@mail.free-electrons.com>
Message-ID: <20170428084433.7pb5lamlgxy2hzau@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Fri, Apr 28, 2017 at 08:28:42AM +0200, Thomas Petazzoni wrote:
>          arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/02f731fa25356650367f82482d0560cd91f73fd6 |     
>      powerpc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/f51e44049e75b9459b9a214604d0f3fef2b6c9d8 |     
>          arc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/ba9d2c9d0547e5ea0ae5c74d03b830983477cf13 |     
>          arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/e2f743a49db9f2be2940a30acfd1a9277a683536 |     
>          arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/4975dbe9c0b78edbe4a8ee98a954a95f0945c4ac |     
>          sh4 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/4a4ddce130c3e921d37fdc1756f97e44ce7d5cdf |     
>     mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/2c2a0f9745fb0b9043ef83d1e7c3d3c0463f0b4d |     
>          arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/aa78260d85d22124c62b4307ffce7b9a15b3073c |     
>       xtensa |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/ca412df3c23317f20465fbddc994e1f914dc58a9 |     
>      powerpc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/1f3e8ad6e019099f262ec5b7d48678c079c743c6 |     
>         m68k |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/a1f0072c1c634186b6f3c9835c1b6fefd5639ac2 |     
>  powerpc64le |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/358980f2ea11de64a7e1f0e1c41672e1c92cecf4 |     
>         i686 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/0e64a8e89a26065946b3d06f654717fd5b06cb65 |     
>          arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/2b779b54234bbf5eef99bbc03fdc789c30a91e9b |     
>     mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/197057bba433136833d3f26733ef090f200ff8d2 |     
>     mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/198c9363b768a9627cdbc7c8ff4da40f55983bc3 |     
>     mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/6cce4b0282f8b6edc39f64ef1edae5c383714522 |     
>         mips |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/d87915146a81660bce24138f3afd48963e211477 |     
>          arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/04100c7c98b3e041409b8f245476fe9a8ce054d1 |     
>      sparc64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/2d75ca65cf60f4332a04c43ed8f9eac670c62c32 |     

Incompatibility of ola with protobuf 3.2.0. An upstream issue[1] is open since 
January.

Should we revert the protobuf bump? Remove ola?

[1] https://github.com/OpenLightingProject/ola/issues/1192

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
