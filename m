From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 13:17:42 +0200
Subject: [Buildroot] [PATCH v3] rauc: new package
In-Reply-To: <20170629190811.16930-1-yurovsky@gmail.com>
References: <20170629205827.086b687a@gmx.net>
 <20170629190811.16930-1-yurovsky@gmail.com>
Message-ID: <20170701131742.6b50a7b2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Jun 2017 12:08:11 -0700, Andrey Yurovsky wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9e421f4..7600cb5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -95,6 +95,9 @@ F:	package/python-scandir/
>  F:	package/python-simplegeneric/
>  F:	package/python-traitlets/
>  
> +N:  Andrey Yurovsky <yurovsky@gmail.com>
> +F:  package/rauc

In addition to what Arnout said, indentation was wrong here, we use a
tab to separate the field name (N:, F:) from its contents.

The rest looked good to me, so I've applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
