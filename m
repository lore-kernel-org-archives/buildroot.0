From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 19:04:57 +0200
Subject: [Buildroot] [PATCH/next 3/3] package/dovecot: Add optional
 support for icu
In-Reply-To: <1432194056-10250-3-git-send-email-bernd.kuhls@t-online.de>
References: <1432194056-10250-1-git-send-email-bernd.kuhls@t-online.de>
 <1432194056-10250-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150713190457.5b405c24@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 21 May 2015 09:40:56 +0200, Bernd Kuhls wrote:
> Optional dependency added to fts plugin since Dovecot 2.2.17:
> http://hg.dovecot.org/dovecot-2.2/diff/b179bbd226e5/configure.ac
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/dovecot/dovecot.mk |    7 +++++++
>  1 file changed, 7 insertions(+)

Applied, thanks.

It's a bit weird to have it handled as an automatic optional dependency
when several other dovecot dependencies have an explicit sub-option
(zlib, bzip2, etc.). But libcap support was already in this order.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
