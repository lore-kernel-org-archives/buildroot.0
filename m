From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 19:38:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/qdecoder: Fix build error
In-Reply-To: <1413754004-4439-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413754004-4439-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141025193854.634df118@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Oct 2014 23:26:44 +0200, Bernd Kuhls wrote:
> Error occured with an allyespackageconfig setup:
> 
> qcgireq.c: In function '_parse_multipart_value_into_disk':
> qcgireq.c:738:60: error: 'errno' undeclared (first use in this function)
>          DEBUG("I/O error. (errno=%d)", (ioerror == true) ? errno : 0);
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/qdecoder/qdecoder-0003-errno.patch |   34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/qdecoder/qdecoder-0003-errno.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
