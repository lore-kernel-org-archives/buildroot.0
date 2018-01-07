From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:12:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.7.4
In-Reply-To: <20180106175020.28092-1-bernd.kuhls@t-online.de>
References: <20180106175020.28092-1-bernd.kuhls@t-online.de>
Message-ID: <20180107151231.5fe97fd9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Jan 2018 18:50:20 +0100, Bernd Kuhls wrote:
> Release notes: https://www.samba.org/samba/history/samba-4.7.4.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...-patch-source3__libads__kerberos_keytab.c.patch | 31 ++++++++++++++++++++++
>  package/samba4/samba4.hash                         |  2 +-
>  package/samba4/samba4.mk                           |  2 +-
>  3 files changed, 33 insertions(+), 2 deletions(-)
>  create mode 100644 package/samba4/0002-patch-source3__libads__kerberos_keytab.c.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
