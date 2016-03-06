From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 6 Mar 2016 06:41:02 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-03-04
In-Reply-To: <20160305073022.BEADE101B7B@stock.ovh.net>
References: <20160305073022.BEADE101B7B@stock.ovh.net>
Message-ID: <20160306044102.GE2877@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Sat, Mar 05, 2016 at 08:30:22AM +0100, Thomas Petazzoni wrote:
>       x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/2aaceac254378d9db7ab7664174007b8c603c77b/

Should be fixed by http://patchwork.ozlabs.org/patch/590524/.

>         i686 |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/6e4529d1e98f0b9cbb16edcd2f4f10dee37b635c/
>       xtensa |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/6913a5699d786592a70d1f19a68e6ff1e109e5cd/
>          sh4 |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/be15acbf6c0ab4fab93a9a9663e98e896cbdac8e/
>          arm |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/5fef265ae3ca275fa8d56c4c05ccb587f4db79ee/
>       xtensa |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/42794e647506272ef02871a1c1d7170094c446cf/

Should be fixed by http://patchwork.ozlabs.org/patch/591606/. The configure.ac
patch is now upstream (commit 77e55b1ea315).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
