From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 20:46:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-asgiref: drop Python 2
 support
In-Reply-To: <20191020151126.2468-1-asafka7@gmail.com>
References: <20191020151126.2468-1-asafka7@gmail.com>
Message-ID: <20191021204617.3acc5a6a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Oct 2019 18:11:25 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Asgiref doesn't support Python 2 since version 2.0.0.
> All the recursive reverse dependencies already support Python 3 only.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-asgiref/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
