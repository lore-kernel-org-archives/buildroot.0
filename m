From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 21:52:10 +0200
Subject: [Buildroot] [PATCH] libcurl: fix nss related build failure
In-Reply-To: <1405944617-4861-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405944617-4861-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140721215210.442cee68@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 21 Jul 2014 09:10:17 -0300, Gustavo Zacarias wrote:
> Patch is a reduced set from upstream (removed RELEASE-NOTES chunk or it
> doesn't apply, cosmetic only). Fixes:
> http://autobuild.buildroot.net/results/d0b/d0bf614006e7c7de749dcea7abd584f0aa142418/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...nk-curl-to-NSS-libraries-when-NSS-support.patch | 41 ++++++++++++++++++++++
>  package/libcurl/libcurl.mk                         |  2 ++
>  2 files changed, 43 insertions(+)
>  create mode 100644 package/libcurl/libcurl-0001-build-link-curl-to-NSS-libraries-when-NSS-support.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
