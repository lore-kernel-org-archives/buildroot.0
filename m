From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 10:32:11 +0200
Subject: [Buildroot] Question on the Auto-builder
In-Reply-To: <87si93rqe6.fsf@dell.be.48ers.dk>
References: <20150704125435.47827cda@core2quad.morethan.org>
 <87si93rqe6.fsf@dell.be.48ers.dk>
Message-ID: <20150705103211.3c1d9216@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 05 Jul 2015 09:54:09 +0200, Peter Korsgaard wrote:

>  > Are the auto-builders set up so that once they 
>  > select either Lua or LuaJIT, they also select
>  > some (or all) of the modules.
> 
> Largely so. They work with configuration snippets selecting a specific
> toolchain configuration and then a random package selection (what you
> get with make randpackageconfig).

With one fairly strong limitation: kconfig "choice" are not
randomized. However in the case of Lua vs. LuaJIT, it's not a kconfig
choice. So I believe both can be selected by the autobuilders.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
