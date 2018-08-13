From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 18:54:53 +0200
Subject: [Buildroot] [RFC PATCH 1/2] scancpan: support more licenses
In-Reply-To: <20180813131135.32651-2-chrismcc@gmail.com>
References: <20180813131135.32651-1-chrismcc@gmail.com>
 <20180813131135.32651-2-chrismcc@gmail.com>
Message-ID: <20180813185453.5b8bae4a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Aug 2018 06:11:34 -0700, Christopher McCrory wrote:

>          $license =~ s|apache_2_0|Apache-2.0|;
> +        $license =~ s|apache_1_1|Apache-1.1|;
> +        $license =~ s|apache|Apache-2.0|;

So just "apache" always means it's Apache-2.0 ?

>          $license =~ s|artistic_2|Artistic-2.0|;
> +        $license =~ s|artistic|Artistic-1.0|;
> +        $license =~ s|lgpl_2_1|LGPL-2.1|;
> +        $license =~ s|lgpl_3_0|LGPL-3.0|;
> +        $license =~ s|lgpl|LGPL-2.1|;

Just "lgpl" always means it's LGPL-2.1 ?

> +        $license =~ s|bsd|BSD|;

"BSD" is not a license. There are several different BSD licenses.
Though with just "bsd" as an initial information, there's not much you
can do :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
