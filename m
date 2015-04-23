From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 09:47:27 +0200
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.42.0
In-Reply-To: <1429767967-6337-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429767967-6337-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150423094727.007e51f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 23 Apr 2015 02:46:07 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-3144 - host name out of boundary memory access
> CVE-2015-3145 - cookie parser out of boundary memory access
> CVE-2015-3148 - Negotiate not treated as connection-oriented
> CVE-2015-3143 - Re-using authenticated connection when unauthenticated
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...1-connectionexists-fix-build-without-NTLM.patch | 54 ++++++++++++++++++++++
>  ...connectionexists-follow-up-to-fd9d3a1ef1f.patch | 48 +++++++++++++++++++
>  package/libcurl/libcurl.hash                       |  2 +-
>  package/libcurl/libcurl.mk                         |  2 +-
>  4 files changed, 104 insertions(+), 2 deletions(-)
>  create mode 100644 package/libcurl/0001-connectionexists-fix-build-without-NTLM.patch
>  create mode 100644 package/libcurl/0002-connectionexists-follow-up-to-fd9d3a1ef1f.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
