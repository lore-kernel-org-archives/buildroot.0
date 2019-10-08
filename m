From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 23:22:09 +0200
Subject: [Buildroot] [PATCH 1/1] scanpypi: write every license file once
In-Reply-To: <20191008090404.26700-2-asafka7@gmail.com>
References: <20191008090404.26700-1-asafka7@gmail.com>
 <20191008090404.26700-2-asafka7@gmail.com>
Message-ID: <20191008232209.254e3c0d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Yegor in Cc.

On Tue,  8 Oct 2019 12:04:04 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> On some cases, when the package contains multiple license files
> and some of them from the same type, the scanpypi script will write
> the same license type more than once under _LICENSE.
> Hence, before creating the _LICENSE variable, we'll remove every
> possible duplication.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  utils/scanpypi | 2 ++
>  1 file changed, 2 insertions(+)

Yegor, it would be nice to have your review on this patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
