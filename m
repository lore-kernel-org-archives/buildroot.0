From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 21:50:32 +0100
Subject: [Buildroot] [PATCH v2] zmqpp: bmp to version 4.1.2
In-Reply-To: <1456335528-14127-1-git-send-email-gustavo@zacarias.com.ar>
References: <1456335528-14127-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160225215032.7fdcd15e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 24 Feb 2016 14:38:48 -0300, Gustavo Zacarias wrote:
> Drop 0001-add-cstdlib-header-to-ensure-EXIT_FAILURE-presence.patch since
> it's already upstream.
> 
> Rebase shared/static build patches - these look unnecessary if we switch
> to cmake-package, however it seems to require the zmq package switches
> to cmake-package as well since static library naming looks different,
> which might be a problem for users.
> 
> Also set the minimum required version of gcc to 4.7.x since the code now
> requires c++1x.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> v2: adjust patch install step for shared=y

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
