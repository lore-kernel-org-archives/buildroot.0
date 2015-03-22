From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 22 Mar 2015 10:19:39 +0200
Subject: [Buildroot] [PATCH 1/1] lirc-tools: new package
In-Reply-To: <1426933124-1445-1-git-send-email-github@wilberforce.co.nz>
References: <1426933124-1445-1-git-send-email-github@wilberforce.co.nz>
Message-ID: <20150322081939.GE2825@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rhys,

Thanks for reposting your patch. But it seems that you missed all my inline 
comments on your patch. Please reread my replay.

Also, when reposting a patch please append a 'v<n>' to the [PATH] prefix, with 
<n> being a version number (e.g. v2, v3, etc.). Since you use git, just add 
-v2 (or -v3 ...) to your git format-path/send-email.

See one more comment below.

On Sat, Mar 21, 2015 at 11:18:44PM +1300, Rhys Williams wrote:
> Signed-off-by: Rhys Williams <github@wilberforce.co.nz>
> ---
>  package/Config.in                |  1 +
>  package/lirc-tools/Config.in     | 15 +++++++++++++++
>  package/lirc-tools/S25lircd      | 39 +++++++++++++++++++++++++++++++++++++++
>  package/lirc-tools/lirc-tools.mk | 30 ++++++++++++++++++++++++++++++
>  4 files changed, 85 insertions(+)
>  create mode 100644 package/lirc-tools/Config.in
>  create mode 100755 package/lirc-tools/S25lircd
>  create mode 100644 package/lirc-tools/lirc-tools.mk

Please also add a .hash file. See 
http://nightly.buildroot.org/manual.html#adding-packages-hash.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
