From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 12:31:31 +0200
Subject: [Buildroot] [PATCH 03/11] ejabberd: fix package version
In-Reply-To: <1436349264-11797-4-git-send-email-johan.oudinet@gmail.com>
References: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
 <1436349264-11797-4-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150711123131.24b7a4cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Wed,  8 Jul 2015 11:54:16 +0200, Johan Oudinet wrote:

> + AC_PREREQ(2.53)
> +-AC_INIT(ejabberd, m4_esyscmd([echo `git describe --tags 2>/dev/null || echo 0.0` | sed 's/-g.*//;s/-/./' | tr -d '\012']), [ejabberd at process-one.net], [ejabberd])
> ++AC_INIT(ejabberd, [15.06], [ejabberd at process-one.net], [ejabberd])
> + REQUIRE_ERLANG_MIN="5.9.1 (Erlang/OTP R15B01)"
> + REQUIRE_ERLANG_MAX="9.0.0 (No Max)"

I've merged this patch, but I'm not too happy with it, because it
has no chance to be upstreamed as is. Do you think this is a problem
you could report upstream, so that they can fix it in a way that works
both for them and for Buildroot?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
