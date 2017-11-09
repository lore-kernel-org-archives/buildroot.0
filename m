From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 9 Nov 2017 09:27:20 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-11-08
In-Reply-To: <20171109070011.4320C209F1@mail.free-electrons.com>
References: <20171109070011.4320C209F1@mail.free-electrons.com>
Message-ID: <20171109072720.ysow3pwt4igf5vva@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Nov 09, 2017 at 08:00:11AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> Build statistics for 2017-11-08
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>       master | 142 |  31 |   0 | 173 |
>    2017.08.x |   6 |   0 |   0 |   6 |

Nice. Thanks for working on that.

> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                   ffmpeg-3.3.5 | 6 
>           usb_modeswitch-2.5.0 | 5 
>                       qt-4.8.7 | 3 
>              freerdp-2.0.0-rc0 | 2 
>               host-erlang-19.3 | 2 
> host-vboot-utils-bbdd62f9b0... | 2 
>                    mp4v2-2.0.0 | 2 
>                asterisk-14.5.0 | 1 
>                   cc-tool-0.26 | 1 
>                       feh-2.21 | 1 
>                   fwup-v0.15.4 | 1 
>        host-go-bootstrap-1.4.3 | 1 
>        kompexsqlite-v1.10.12-1 | 1 
>                 openobex-1.7.2 | 1 
>            python-numpy-1.13.3 | 1 
>               wireshark-2.2.10 | 1 
> 
> 
> Detail of failures
> ------------------

Having an additional 'branch' column here might be useful now.

Unrelated to that (I think), DNS resolution for autobuild.buildroot.net looks 
strange this morning:

$ host autobuild.buildroot.net
autobuild.buildroot.net is an alias for ks383786.kimsufi.com.
ks383786.kimsufi.com has address 94.23.254.152

baruch

> 
>          arc |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/4812f29a164baa390cf8b525c43676fdd7a0aad8 |     
>         m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/0fb7cb19049d9b8e075e17ff881e740c2996c9e2 |     
>          arm |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/e58e248fab88015580cff8ae1e247ed67a6a859c |     
>          arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/f0848a27c5cd57187e2681755ade4bbcc549067d |     
>          arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/ff3e8ab1d1dd49156de8a10b225adf0876ced31d |     
>          arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/a4da63c5535ddc7eb97342a2bb2b03206b1501bf |     
>          arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/88b2ac13c69540d1dfadf206b1a91eb3db72fdc2 |     
>          arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/4010d4ffcb46cbc3b73a525107a0b9eb3fff908f |     
>          arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/038e450dc9c1bb9d20de7ad8ffacccb23193c4b5 |     
>       xtensa |              freerdp-2.0.0-rc0 | NOK | http://autobuild.buildroot.net/results/72c7128d1befb9202f9807d7e93a09d30ff062f9 |     
>          arm |              freerdp-2.0.0-rc0 | NOK | http://autobuild.buildroot.net/results/5d5e4dab4ffe2cab0ebb3904c93f630b0de09ff2 |     
>          arc |                   fwup-v0.15.4 | NOK | http://autobuild.buildroot.net/results/bd59b622afd09264668f80ec122ea5eca85bbbf6 |     
>          arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/fcf58b415435f635f4256c6edab57c138bff9d7f |     
>          arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/20c0b26e8b852dec317db4e6a7ce7b6a4698cbff |     
>          arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/4f73a401e300b574653e4ec76dd9ed939d838ee8 |     
>       xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/31ee0cf45455b08e9064f402a447723604450ee9 |     
>       xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/54dd995e4e7171ccc47402276044c7854948098f |     
>       xtensa |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/4d9f5f0ffada5cff729fb3b618ee3a11ad1e3790 |     
>          arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/81037735394a73ea24e494348bb1580d1c5840ef |     
>          arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/f58f9d3c481155594d46570f20734eeb93cbef78 |     
>         bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/e5d11cced3d1cb09f4b859e5a8ebf9a24376dbcf |     
>          arc |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/4c4eaa90335756448007ae3c5ae3839fb17d4442 |     
>          arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/01b52fec0f55161207246a1cd39835261dac4395 |     
>       xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5d626189a1b141b201c95c7eab9beb8960383c4f |     
>          arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/36167e6c59947ca0999190c41e3664ffc13e883b |     
>         i586 |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/db78329dc008760a5c8873f4c05e1fcba98b8dd3 |     
> microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/b735fa553160a178e1461f82ff6a2824e405a470 |     
>         or1k |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/52240059e181d8bf1acd9a55460cae5daffbad6c |     
>      aarch64 |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/ec9004c6c5ea05213b0207917a395b0dcd39fdac |     
> microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/6499634c2cae14faef15bd35a563e20e33ef60b1 |     
>       xtensa |               wireshark-2.2.10 | NOK | http://autobuild.buildroot.net/results/d7de55c8c778cd530c02a51fe2e534c966d922ac |     
> 

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
