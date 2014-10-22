From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 18:01:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/beecrypt: Replace work-around
 to fix gcc-4.7 compile error
In-Reply-To: <1413738477-4079-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413738477-4079-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141022180114.1b476c62@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Oct 2014 19:07:57 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/beecrypt/beecrypt-0004-gcc-4.7.patch |   19 +++++++++++++++++++
>  package/beecrypt/beecrypt.mk                 |    6 ------
>  2 files changed, 19 insertions(+), 6 deletions(-)
>  create mode 100644 package/beecrypt/beecrypt-0004-gcc-4.7.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
