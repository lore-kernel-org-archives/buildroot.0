From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 21:19:43 +0100
Subject: [Buildroot] [PATCH] liquid-dsp: blacklist CS powerpc toolchains
In-Reply-To: <1447784444-5336-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447784444-5336-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151117211943.3b638229@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 17 Nov 2015 15:20:44 -0300, Gustavo Zacarias wrote:
> They're unable to build liquid-dsp successfully resulting in an internal
> compiler error. Fixes:
> http://autobuild.buildroot.net/results/2ac/2acd745f4e5ec6edfd09afcd57b9ece216724c1b/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/liquid-dsp/Config.in | 3 +++
>  1 file changed, 3 insertions(+)

You forgot to use the same dependencies in the comment, to avoid it
being displayed in cases where the package can anyway not be enabled.
I've applied to master after fixing this. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
