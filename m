From: ren_guo <ren_guo@c-sky.com>
Date: Fri, 10 Mar 2017 09:07:28 +0800
Subject: [Buildroot] [PATCH v2 1/1] toolchain/helpers.mk: fixup
 check_gcc_version.
In-Reply-To: <20170309213003.25a3b356@free-electrons.com>
References: <1487685891-29747-1-git-send-email-ren_guo@c-sky.com>
 <20170309213003.25a3b356@free-electrons.com>
Message-ID: <9a2315bb-fbab-a870-2ebe-8518fd23a5c2@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thx Thomas,

> A different, and much simpler fix was committed in
> https://git.buildroot.org/buildroot/commit/?id=06cd604ec6d34f25b436ab729543418042a87e1c.

'gcc -dumpversion' is a good solution.
We've also changed the our pkgversion without '()'  :)

Best Regards
Guo Ren
