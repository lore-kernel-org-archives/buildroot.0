From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 10:57:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump to 4.4.5
In-Reply-To: <1467926041-23296-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467926041-23296-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160708105739.71e59912@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jul 2016 23:14:01 +0200, Bernd Kuhls wrote:
> Fixes CVE-2016-2119
> https://www.samba.org/samba/security/CVE-2016-2119.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/samba4/samba4.hash | 4 ++--
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
