From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 18:08:59 +0200
Subject: [Buildroot] [PATCH] uclibc: fix issues with udp.h,
 missing stdint.h
In-Reply-To: <20170709070219.GA26523@waldemar-brodkorb.de>
References: <20170709070219.GA26523@waldemar-brodkorb.de>
Message-ID: <20170709180859.3dd3701f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 9 Jul 2017 09:02:19 +0200, Waldemar Brodkorb wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/3e4/3e468c7b1be376024422e2f06750571f64f433a2/
>   http://autobuild.buildroot.net/results/8c6/8c629a1c5c4a1d78c8bf09a091a332a424a0f757/
> 
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...-udp.h-sync-completely-with-GNU-C-library.patch | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/uclibc/0002-udp.h-sync-completely-with-GNU-C-library.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
