From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 4 Mar 2015 07:44:35 +0200
Subject: [Buildroot] [PATCH] kmod: needs largefile
In-Reply-To: <1425447280-21873-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425447280-21873-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150304054435.GV15668@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Wed, Mar 04, 2015 at 06:34:40AM +0100, Fabio Porcedda wrote:
> Since version 20 it requires largefile support.
> 
> http://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=481ad14550087c77c9df6d117c7a975a38a4ad33
>  - Disable --disable-largefile. We already had possible bugs in the
>    index implementation if this were passed. It's now fixed, but it's
>    never tested. Disable it.
> 
> Fix build failure:
> configure: error: --disable-largefile is not supported by kmod
> package/pkg-generic.mk:172: recipe for target 'output/build/kmod-20/.stamp_configured' failed
> 
> Fixes:
> http://autobuild.buildroot.net/results/f662d9230e4bc2da7dc56a2ffd493cc37254d377//
> http://autobuild.buildroot.net/results/233ec8ee346e15d41658cffc6bbb4a6c9dd46746//

Your SoB is missing.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
