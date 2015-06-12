From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 21:59:55 +0200
Subject: [Buildroot] [PATCH v5 2/3] lutok: new package
In-Reply-To: <1434063093-14906-3-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1434063093-14906-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <1434063093-14906-3-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <20150612215955.52d4061a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sebastien Bourdelin,

On Thu, 11 Jun 2015 18:51:32 -0400, Sebastien Bourdelin wrote:
> Lutok is a lightweight C++ API library for Lua.
> 
> https://github.com/jmmv/lutok
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
> ---
> Changes v4 -> v5:
>   suggested by Arnout Vandecapelle <arnout@mind.be>:
>   - force the --without-atf option to not build the example tests.
>   - puts the dependencies &&-ed in Config.in on 2 lines
>   - adds comment to explain the need of dlopen

Applied, thanks, after doing the tweaks that I highlighted already:

    [Thomas:
     - move lutok inclusion in package/Config.in after including the Lua
       external modules
     - add a comment explaining why we are passing --without-atf
     - remove the logic around -ldl, it seems to build just fine without it.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
