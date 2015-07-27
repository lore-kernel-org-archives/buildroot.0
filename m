From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:51:27 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/exfat-utils: fix compilation
 error with musl
In-Reply-To: <1437951045-14508-1-git-send-email-brendanheading@gmail.com>
References: <1437951045-14508-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150727225127.235df019@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Sun, 26 Jul 2015 23:50:45 +0100, Brendan Heading wrote:
> exfat-utils build would not build on Linux unless __GLIBC__ was defined.
> Patch added to use more relaxed __linux__ instead.
> 
> See http://autobuild.buildroot.net/results/c60/c60d0f9a93c90d41c3c86c78b0a0
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> 
> ---
> Changes v1 -> v2 :
>    - removed unnecessary dependency change
>    - improvements (much simpler patch) as suggested by Thomas P

Applied, thanks. Can you please submit the patch upstream?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
