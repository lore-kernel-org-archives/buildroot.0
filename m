From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Aug 2015 10:15:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/sudo: bump to version 1.8.14p3
In-Reply-To: <1438415164-12441-1-git-send-email-joerg.krause@embedded.rocks>
References: <1438415164-12441-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150801101521.3b1ccef9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat,  1 Aug 2015 09:46:04 +0200, J?rg Krause wrote:
> Also add a patch to fix missing header include with the musl C library:
>   ../include/sudo_util.h:220:14: error: unknown type name 'id_t'
> 
> Reported upstream:
> http://bugzilla.sudo.ws/show_bug.cgi?id=711
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/sudo/0001-musl-fix-missing-header.patch | 19 +++++++++++++++++++
>  package/sudo/sudo.hash                          |  4 ++--
>  package/sudo/sudo.mk                            |  2 +-
>  3 files changed, 22 insertions(+), 3 deletions(-)
>  create mode 100644 package/sudo/0001-musl-fix-missing-header.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
