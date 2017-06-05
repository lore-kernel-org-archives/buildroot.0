From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 10:12:50 +0200
Subject: [Buildroot] [PATCH 1/3] package/ipsec-tools: allow autoreconf
In-Reply-To: <20170602185053.11029-1-bernd.kuhls@t-online.de>
References: <20170602185053.11029-1-bernd.kuhls@t-online.de>
Message-ID: <20170605101250.792913c4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Jun 2017 20:50:51 +0200, Bernd Kuhls wrote:
> Upstream release is broken w.r.t autoreconf, patch 0002 fixes it.
> Needed to prepare for upcoming patch to fix linking against newer
> flex versions.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ipsec-tools/0002-configure-automake.patch | 21 +++++++++++++++++++++
>  package/ipsec-tools/ipsec-tools.mk                |  2 ++
>  2 files changed, 23 insertions(+)
>  create mode 100644 package/ipsec-tools/0002-configure-automake.patch

All three patches applied to master. However, could you comment on
whether PATCH 3/3, which is a security update, applies to the LTS
branch 2017.02.x ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
