From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 21:43:02 +0200
Subject: [Buildroot] [PATCH 3/4] swupdate: improved help text for Lua
 support
In-Reply-To: <20160724232739.14132-4-jordan@yelloz.me>
References: <20160724232739.14132-1-jordan@yelloz.me>
 <20160724232739.14132-4-jordan@yelloz.me>
Message-ID: <20161025214302.65896375@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 16:27:38 -0700, Jordan Yelloz wrote:
> It now explains limitations of building against Lua < 5.2 interpreters
> and how to link to LuaJIT library.
> 
> Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
> ---
>  package/swupdate/Config.in | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

In the end, I decided to apply your patch, with just a little bit of
rewording.

Following the discussion we had back in July, do not hesitate to send
another patch series that uses KCONFIG_SET_OPT to automatically set the
appropriate options in swupdate configuration. But this should be done
not only for Lua, but also for other features.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
