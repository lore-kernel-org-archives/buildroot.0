From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 18:57:25 +0100
Subject: [Buildroot] [PATCH] ipset: Don't include host headers
In-Reply-To: <c69b0ea4caf640e9ca3c2357f6e701cab02fa689.1414449206.git.baruch@tkos.co.il>
References: <c69b0ea4caf640e9ca3c2357f6e701cab02fa689.1414449206.git.baruch@tkos.co.il>
Message-ID: <20141028185725.53f96e89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 28 Oct 2014 00:33:26 +0200, Baruch Siach wrote:
> Add a patch removing /usr/local/include from the include path.
> 
> Fixes:
> http://autobuild.buildroot.net/results/4f5/4f55c2415281c6204500efe28fe9e24c8ef73863/
> 
> Technically speaking this autobuild failure has already been fixes when
> -Werror was removed in commit a923b44112aa3 (ipset: add patch to fix
> --enable-debug build). But the warning in this case indicates a real problem
> that needs to be fixed by itself.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...Make_global.am-Don-t-include-host-headers.patch | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/ipset/0002-Make_global.am-Don-t-include-host-headers.patch

Thanks, applied. Can you please submit the patch upstream?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
