From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 16:05:50 +0200
Subject: [Buildroot] [PATCH v2 1/6] support/download: Add support to
 pass options directly to downloaders
In-Reply-To: <20160724140401.GA5866@free.fr>
References: <1468315820-9341-1-git-send-email-romain.perier@free-electrons.com>
 <1468315820-9341-2-git-send-email-romain.perier@free-electrons.com>
 <20160715204729.GH3692@free.fr>
 <20160724160048.39770315@free-electrons.com>
 <20160724140401.GA5866@free.fr>
Message-ID: <20160724160550.4d3a8595@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 16:04:01 +0200, Yann E. MORIN wrote:

> Because "${@}" expands to nothing if there is no paramter.
> 
> http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18
> 
> @
>     Expands to the positional parameters, starting from one. When the
>     expansion occurs within double-quotes, and where field splitting (see
>     Field Splitting) is performed, each positional parameter shall expand
>     as a separate field [...]. If there are no positional parameters, the
>     expansion of '@' shall generate zero fields, even when '@' is
>     double-quoted.

Aaah. Didn't know that. Thanks for the explanation.

Romain, can you respin to use "${@}" like Yann suggested, and fix the
other issues pointed by Yann?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
