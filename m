From: Austin Foxley <austinf@cetoncorp.com>
Date: Sun, 20 Sep 2009 16:32:22 -0700
Subject: [Buildroot] [PATCH] Add a config option for gcc tls support,
 rather than disabling it blindly
In-Reply-To: <1253488573-4832-1-git-send-email-austinf@cetoncorp.com>
References: <1253488573-4832-1-git-send-email-austinf@cetoncorp.com>
Message-ID: <4AB6BB86.40303@cetoncorp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/20/2009 04:16 PM, Austin Foxley wrote:
> Defaulted to yes, but blocked it from gcc 4.4.x since the disable was
> originally added because of problems with its c++ support reportedly.
> 
> Signed-off-by: Austin Foxley <austinf@cetoncorp.com>
> ---
>  toolchain/gcc/Config.in         |    7 +++++++
>  toolchain/gcc/gcc-uclibc-4.x.mk |   12 +++++++++---
>  2 files changed, 16 insertions(+), 3 deletions(-)

Doh, spelled the name of the config option wrong. Ignore this one, re-sending...

-Austin
