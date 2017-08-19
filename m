From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Aug 2017 16:08:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/xen: fix build with gcc7
In-Reply-To: <20170819064645.8807-1-bernd.kuhls@t-online.de>
References: <20170819064645.8807-1-bernd.kuhls@t-online.de>
Message-ID: <20170819160849.73efbb5d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Aug 2017 08:46:45 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/f95/f9553c1669bd05acee3ccea76e36c2474e534d8c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xen/0003-gcc7.patch | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 package/xen/0003-gcc7.patch

I've applied to master, after reformatting the patch with Git, and
adding a better patch description. See
https://git.buildroot.org/buildroot/commit/?id=fb1ad31e61e4e38ef06d49390516a0a3a062324d.

I would really appreciate if you could use Git to format the patches,
when the upstream developers of the package also use Git as their
version control system.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
