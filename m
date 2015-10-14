From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 23:53:41 +0200
Subject: [Buildroot] [PATCH] slang: forcibly disable oniguruma support
In-Reply-To: <1444858938-27714-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444858938-27714-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151014235341.36e7b482@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 14 Oct 2015 18:42:18 -0300, Gustavo Zacarias wrote:
> If the host has oniguruma installed then slang can detect it and try to
> (wrongly) link against it resulting in build failure. Fixes:
> http://autobuild.buildroot.net/results/51f/51ff079ebbd363e0445d226ec80bc28e524fd88c/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/slang/slang.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
