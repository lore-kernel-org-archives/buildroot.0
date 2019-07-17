From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 08:43:47 +0200
Subject: [Buildroot] [PATCH] package/python-idna: select
 PYTHON3_UNICODEDATA
In-Reply-To: <20190716175830.604552-1-alex_y_xu@yahoo.ca>
References: <20190716175830.604552-1-alex_y_xu@yahoo.ca>
Message-ID: <20190717084347.784866e3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alex,

On Tue, 16 Jul 2019 13:58:30 -0400
"Alex Xu (Hello71)" <alex_y_xu@yahoo.ca> wrote:

> Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>

Thanks for your patch. However, the commit log is empty, and therefore
it doesn't carry any explanation as to why this change is necessary.
Could you give more details ?

> diff --git a/package/python-idna/Config.in b/package/python-idna/Config.in
> index 1fd56ceaf6..c247fa89d0 100644
> --- a/package/python-idna/Config.in
> +++ b/package/python-idna/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_IDNA
>  	bool "python-idna"
> +        select BR2_PACKAGE_PYTHON3_UNICODEDATA

Nit: there is an indentation problem, we indent those lines with a tab,
not with spaces.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
