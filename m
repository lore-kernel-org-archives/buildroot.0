From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 23:10:19 +0100
Subject: [Buildroot] [PATCH] acpid: bump to version 2.0.27
In-Reply-To: <1458684499-1117-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458684499-1117-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160322231019.634b98f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Mar 2016 19:08:19 -0300, Gustavo Zacarias wrote:
> Drop 0003-support-for-non-glibc-libcs.patch since it's upstream.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../acpid/0003-support-for-non-glibc-libcs.patch   | 184 ---------------------
>  package/acpid/acpid.hash                           |   5 +-
>  package/acpid/acpid.mk                             |   2 +-
>  3 files changed, 4 insertions(+), 187 deletions(-)
>  delete mode 100644 package/acpid/0003-support-for-non-glibc-libcs.patch

I like when patches disappear because they have been upstreamed.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
