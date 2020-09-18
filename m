From: Michael Nosthoff <buildroot@heine.tech>
Date: Fri, 18 Sep 2020 21:58:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/netcalc: new package
In-Reply-To: <20200918060425.812748-1-troglobit@gmail.com>
References: <20200918060425.812748-1-troglobit@gmail.com>
Message-ID: <28ab1a5b-e2fb-2688-2204-7a302031d3df@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 18.09.2020 08:04, Joachim Wiberg wrote:
> netcalc is a slimmed down clone of sipcalc, using the popular output
> format of ipcalc (perl).  It is written in C and only depends on a
> POSIX compliant C library.  Both IPv4 and IPv6 are supported.
>
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Looks good to me.

Reviewed-by: Michael Nosthoff <buildroot@heine.tech>

Tested-by: Michael Nosthoff <buildroot@heine.tech>

compiled with gcc 9.2.1 for and run on arm A15


Regards,

Michael
