From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Aug 2014 09:26:48 -0300
Subject: [Buildroot] [PATCHv2] package/gcc: cleanup arch/cpu combinations
In-Reply-To: <20140820142417.31c93ef2@free-electrons.com>
References: <1408482998-24200-1-git-send-email-gustavo@zacarias.com.ar>
 <20140820142417.31c93ef2@free-electrons.com>
Message-ID: <53F49408.3050701@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/20/2014 09:24 AM, Thomas Petazzoni wrote:
> What do you think of a solution like:
> 
>   [Buildroot] [PATCH] toolchain/gcc: Introduce BR2_ARCH_HAS_GCC_x_y_PLUS
> 
> which Mischa Jonker posted a while ago (but didn't push strong enough
> to get it merged) ?

Hi.
I thought about that but it really doesn't help in this scenario in a
complete way, since a given gcc may be broken (like 4.9.x was for ppc
e500) even though it includes support because of bitrot or bugs, like
some sparc targets, or blackfin for that matter.
Regards.
