From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 23:07:33 +0100
Subject: [Buildroot] [PATCH 1/3] package/dovecot: Remove bzip2 and zlib
 options
In-Reply-To: <1455137899-18008-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455137899-18008-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160216230733.3c4f4542@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 10 Feb 2016 21:58:17 +0100, Bernd Kuhls wrote:
> The next patch of this series will add optional xz and lz4 support, to
> avoid adding new options for these compression packages simplify the
> configuration of dovecot by removing the options handling optional
> compression support.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  Config.in.legacy           | 14 ++++++++++++++
>  package/dovecot/Config.in  | 12 ------------
>  package/dovecot/dovecot.mk |  4 ++--
>  3 files changed, 16 insertions(+), 14 deletions(-)

All three patches applied on master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
