From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 21:34:20 +0100
Subject: [Buildroot] [PATCH] package/libwebsock: allow building without
 SSL
In-Reply-To: <1420369662-18185-1-git-send-email-yann.morin.1998@free.fr>
References: <1420369662-18185-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150104213420.248ba3b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  4 Jan 2015 12:07:42 +0100, Yann E. MORIN wrote:
> libwebsock can optionally use SL, and defaults to using it without
> checking for its presence first.
> 
> Just disable SSL support if openssl is not enabled, and ensure it is
> built before libwebsock if it is enabled.
> 
> Add a patch to fix SSL conditional build.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/2c4/2c49e45667aaf2f2a59ace94885b9d4ed98038d7/
>     http://autobuild.buildroot.org/results/517/517bc814732f86dc6dd1a5c91148ce52ec9803f7/
>     http://autobuild.buildroot.org/results/951/95109c7e37aa21228bc71c69e9c66a6821f3174a/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gregory Dymarek <gregd72002@gmail.com>

Thanks, applied. Can you submit your patch upstream? I have already
submitted the 0001 patch upstream, see
https://github.com/payden/libwebsock/pull/27.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
