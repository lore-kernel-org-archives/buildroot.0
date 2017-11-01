From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Nov 2017 10:37:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/openjpeg: fix static library
 install
In-Reply-To: <20171101072018.29979-1-bernd.kuhls@t-online.de>
References: <20171101072018.29979-1-bernd.kuhls@t-online.de>
Message-ID: <20171101103715.53663c9a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Nov 2017 08:20:18 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/c35/c35599e6bf09aebe456ea959d7c238f82090fc62/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/openjpeg/0004-install-static-lib.patch | 27 ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 package/openjpeg/0004-install-static-lib.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
