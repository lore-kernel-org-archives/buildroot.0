From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 23:18:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump to
 version 4.5.10
In-Reply-To: <20170524210611.3155-1-bernd.kuhls@t-online.de>
References: <20170524210611.3155-1-bernd.kuhls@t-online.de>
Message-ID: <20170529231805.1e68dece@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 May 2017 23:06:11 +0200, Bernd Kuhls wrote:
> Fixes CVE-2017-7494:
> https://www.samba.org/samba/history/samba-4.5.10.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/samba4/samba4.hash | 2 +-
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
