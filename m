From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 11:03:20 +0200
Subject: [Buildroot] [PATCH] gst1-imx: add menuconfig to select each
 plugin individually
In-Reply-To: <20160921083258.4ngcz3pphrgjyp46@t450s.lan>
References: <20160916131038.23240-1-gary.bisson@boundarydevices.com>
 <20160920210425.1ca82f17@free-electrons.com>
 <20160920224355.l76a3kggupuiugok@t450s.lan>
 <20160921060213.2f292837@free-electrons.com>
 <20160921083258.4ngcz3pphrgjyp46@t450s.lan>
Message-ID: <20160921110320.1d539eca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Sep 2016 10:32:58 +0200, Gary Bisson wrote:

> No, as pointed above in the package repo, the --enable-foo doesn't exist
> and is discarded. It doesn't introduce any error, but it is just that we
> are passing arguments that we know are discarded, is it really
> necessary? I might go with the comment although there's no failure if
> the option is passed, what do you think?

OK, in this case, not passing --enable and having a comment sounds good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
