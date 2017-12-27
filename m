From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 27 Dec 2017 09:25:20 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-12-26
In-Reply-To: <20171227070009.9C569203A1@mail.free-electrons.com>
References: <20171227070009.9C569203A1@mail.free-electrons.com>
Message-ID: <CAAMH-yuUTCcrnotOd+SB0t8UfHOSCD0Nd8nMeX6SBS60Kn0=Rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Dec 27, 2017 at 8:00 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Build statistics for 2017-12-26
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>       master | 212 |  78 |   1 | 291 |
>    2017.08.x |  16 |   3 |   0 |  19 |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>          host-cryptsetup-2.0.0 | 32
>                     brltty-5.5 | 13
>              libostree-2017.15 | 8
>                  libv4l-1.12.6 | 7
>            host-mono-5.4.0.201 | 3
>               lynx-2.8.9dev.16 | 2
>                  mplayer-1.3.0 | 2
>                   boost-1.65.1 | 1
>                   cc-tool-0.26 | 1
>                   ffmpeg-3.4.1 | 1
>                      gpsd-3.16 | 1
>                    jamvm-2.0.0 | 1
>                  libpqxx-4.0.1 | 1
>                    mpd-0.20.12 | 1
>                     php-7.1.12 | 1
>                      pound-2.7 | 1
>                       qt-4.8.7 | 1
>              qt5location-5.9.3 | 1
> yavta-82ff2efdb9787737b9f21... | 1
>
>
> Detail of failures
> ------------------
>
>      powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/d35dc3b216f36599ba22a369168f62d143fbf648 |
>          arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/b9be7cc2eaca86f0fc84488de8eed55a2b94b408 |
>          arc |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/412e9987cfe1b266af35e32ab368bee71482857b |
>     mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/5123759b1fd84249310093d5b9d2f1021079df38 |
>          sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/1c17c36116a3c81ed9e69311dd20d8ad08702e2d |
>          sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/d1b171ee10337a63377334917d6bf685108874fe |
>     mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/e8a3ddff74f354eeadb0e6c75bb59efbfb90ce59 |
>     mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/f49cee0c782f16cfb3b6fc079509acea3fdf3563 |
>     mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/ff99321cf331a475a1b3b72643faf447cc00fca2 |
>          arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/8a18c652ac12678a5807f5dc061b3b30dbea438b |
>     mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/10e3abef8da115cbd2869f4c3904470deedf0246 |
>         bfin |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/ef038af28b959631ca1233b1c4712feaf1824661 |
>         bfin |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/8b90cb47e2052c22812ff257ac9387a5fa9268cf |
>         or1k |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/1a56a3ed85cd7924323b24eec1a9f615b126ea08 |
>         m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/579df00d2d0155919b2831912438d5e5311bdfa6 |
>          arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/d1cf289be3c90e04c9bdedb76ec3ee59c4b34a18 |
>          arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/126b6cb955b3e490cdb8abc74a7a2b57641123d1 | ORPH
>          sh4 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/39247a48d23fd00209349f23a9181b99c7c38ef6 |
>          arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/6fb315571d255c84fb9c78cff4ce986046f19e88 |
>      sparc64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/ea1a48ca17204956845063378ce8909c8f4258bc |
>         m68k |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/89f6f147911585a2e0423fc0a508dc604f968e43 |
>       mipsel |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/df3cc21b2abb29db52784c98ef8fb85efbbcd8c4 |
>         i586 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/fbe71ba81784a9b8918044dd0b53943537b52567 |
>     mips64el |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/fd5525d29a45d82202a36673d9d0388b25d22126 |
>          arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/924691dd0c5253618b7be3e9326233b804441e03 |
>       xtensa |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/4d9d5eb302dd5ca8cb6b01db99628bea8cbc5c47 |
>       mipsel |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/e99a9ea0666400164782661f92fdaabc8a2914a1 |
>     mips64el |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/cfe967e865ad78aa3e6b5a7c1158a43cfa23387c |
>          arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/08034bce830eb9306728c94ee2f6ff797085ba71 |
>       mipsel |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/eb20cc903aa5bf1ebdc9426f52dcb9cb6346580c |
>          arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/19699ea55761a2e8c22ed2b43f40df53bea3459f |
>      powerpc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/d755b0393520c0c003a37e480f970b659e59d193 |
>         m68k |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/b0dc94281fe028f5e03f5afa731f7cdf2525df0e |
>      aarch64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/269fe3afc7f59ead21401a1566cb923d7b1fc621 |
>      aarch64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/5d039bea9282c28c81da9e3ca2970b03724a8eff |
>      aarch64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/599d444595ec05658af8aaa341ce5d4b9ba6eda2 |
>          arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/a57ee202191f4d84dcaaa81744820ece944a15c3 |
>         m68k |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/e90e033a3a8233ade4ce9bbc8f806e532a7d8f66 |
>          arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/f0b60e12329a9872e8d50813ac39941ba69876b7 |
>       x86_64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/f6f9f870f1024158e9ad00a3b1f010ed792d51b9 |
>          arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/3b48fa1e9576f4fe60fc1d5e5691f93d4395d1aa |
>          arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/18bcf051f5178c377b2b350687672554a471be61 |
>          arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/637eb9264b2515edf06dde3909d23b72b1eef322 |
>          arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/a672b3317bfd0669c79fc2952003cc14c19e5057 |
>         i686 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/71fd2458f3f232c4dfbdb407161056b012355286 |
>         m68k |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/23cc6a8a4d0e17f52eb4f03be51a1e48d1370b39 |
>        nios2 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/c03a62197b4842859f2b7293f88fd16af25de405 |
>     mips64el |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/b92b5eb0c22814b795015aa6c7a64b5fdcf15d9b |
>       xtensa |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/54f367d030d34235d1b064817dd02375b19f1905 |
>          arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/4726a0c2652a85ebe7c64c54d6d2b4445d867f40 |
>          arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/00caeada665066a8c47034d045541bb95bc41374 |
>          arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/e7ddc3fc676d634c65d44b3db55bfa8a30591212 |
>       mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/2616a2488a0509467a95732c4bdf42688c2b14a3 | ORPH
>         i686 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/e14438ac99f18430ca78be83724a27ede58bdf92 |
>          arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/d7a24132b6895c9278d286615bc01eaf4b8e91c2 |
>          sh4 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/9f602e1b5c0b904d772b5339e338fe6f020b7401 |
>      sparc64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/d54ea2ff7407ee00a237115225b1994f3fa9cd5c |
>      powerpc |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/d23aa426049b9a14a1f40f151e7233ee55384cf4 |
>         mips |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/ff69b49ac6ec2dd4785ce611abb14c32e4d05038 |
>       x86_64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/08b8036223ce3c251cae32c718962877b8106030 |
>     mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/6cc1d0e3276203f66d3e914d572b6c006ea5764a |
>          arc |                  libpqxx-4.0.1 | NOK | http://autobuild.buildroot.net/results/0d131f9fa5cce259d999f7d57f9092675bfc24c7 |
>       xtensa |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/f50ebe2ee0336dae3aab1752b2000c8955ae5857 | ORPH
>       xtensa |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/f8e4e7704a6463fb746fe865ec7b350196975a2c | ORPH
>          arm |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/643ca35802895279383e349128359664b4618b91 | ORPH
>          arc |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/bb6f2460248a1061038feebfaa6eeef18303052c | ORPH
>          arm |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/57339ddb8a2f889835aba4d37053a9f02bacc0b8 | ORPH
>         i686 |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/65566b4cce61c5cb39388e7cfe54cc8d45b14f0c | ORPH
>         i686 |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/b9daf3402936565093b7d49f56c79e0b46f55b18 | ORPH
>      powerpc |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/187c471d643c60cc98ef456054d3d7bfdf3096b4 |
>          arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/e4f3149fb3f9c93288fb11b852173729d242f69c |
>          arc |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/f0e845f20c27cc26355b32f114c3947afda879c5 |
>         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6d2f7ce37a9b97b3a0ece4e1a930e47121c16e24 |
>  powerpc64le |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/c763674e0fccf2cedaaa1ee6069326cfd90bc594 |
>          arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/d8a491881696df7c891f2b1f6230194443f5ab13 | ORPH
>          arm |                      pound-2.7 | NOK | http://autobuild.buildroot.net/results/7e7c85ee377045026f2cb45430e510199d2ee4c8 |
>      powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c9fe077bae56ef66b6f01e6bfa91ca2a9eb7ce16 | ORPH
>         mips |              qt5location-5.9.3 | NOK | http://autobuild.buildroot.net/results/10db2b54f76d998a083144129034913e2461c1eb |
>         i586 | yavta-82ff2efdb9787737b9f21... | TIM | http://autobuild.buildroot.net/results/d44170be257092716722b1ce29d9b8503345c36b |
>
> Results for branch '2017.08.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
>                   cc-tool-0.26 | 1
>                  host-icu-59.1 | 1
> host-mfgtools-b219fc219a35c... | 1
>
>
> Detail of failures
> ------------------
>
>         m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/fac0b3953f6975bc332a22bd303fb13ea46252cb |
>       mipsel |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/225798a3a99da96d01f4ee018a109fa7016ade8a | ORPH
>          arm | host-mfgtools-b219fc219a35c... | NOK | http://autobuild.buildroot.net/results/e489c409d2bada831b566197578d637c0d8f6c71 |

This last bug was fixed by Romain yesterday:
https://git.buildroot.net/buildroot/commit/?id=34c4c0680a6de06e8c11e7361c26c8594315ba36

This won't be fixed in 2017.08.x if I understand correctly, only
master, 2017.2.x and 2017.11.x will have the patch merged.

Regards,
Gary
