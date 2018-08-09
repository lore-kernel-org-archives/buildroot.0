From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 10:08:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: Disable build of
 manpages and documentation
In-Reply-To: <20180808184155.1486-1-bernd.kuhls@t-online.de>
References: <20180808184155.1486-1-bernd.kuhls@t-online.de>
Message-ID: <20180809100852.7345aabc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Aug 2018 20:41:55 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/3f2/3f214cbb1fe2dc2c2cbfb630032e13eba81c1b5a/
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/samba4/0004-no-man.patch | 101 +++++++++++++++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 package/samba4/0004-no-man.patch

Samba is maintained under Git, in such cases, please use Git formatted
patch. I've fixed that before applying to master.

That being said, the patch itself isn't really nice. It would really be
better to find an upstream acceptable solution for this. I've
nonetheless applied, because we want to fix those annoying build
failures.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
