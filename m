From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:29:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/glibc: Add security patches to
 fix CVE-2016-3075
In-Reply-To: <1461527419-31810-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461527419-31810-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160424232913.2fa56785@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Apr 2016 21:50:19 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/glibc/2.22/0003-fix-CVE-2016-3075.patch | 44 +++++++++++++++++++++++
>  package/glibc/2.23/0001-fix-CVE-2016-3075.patch | 47 +++++++++++++++++++++++++
>  2 files changed, 91 insertions(+)
>  create mode 100644 package/glibc/2.22/0003-fix-CVE-2016-3075.patch
>  create mode 100644 package/glibc/2.23/0001-fix-CVE-2016-3075.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
