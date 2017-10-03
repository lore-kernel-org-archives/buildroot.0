From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Oct 2017 22:03:02 +0200
Subject: [Buildroot] [PATCH 1/6] lpeg-patterns: new package
In-Reply-To: <20170924161859.10994-1-francois.perrad@gadz.org>
References: <20170924161859.10994-1-francois.perrad@gadz.org>
Message-ID: <20171003220302.4e08c9b6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Sep 2017 18:18:54 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                        |  1 +
>  package/lpeg-patterns/Config.in          |  8 ++++++++
>  package/lpeg-patterns/lpeg-patterns.hash |  2 ++
>  package/lpeg-patterns/lpeg-patterns.mk   | 14 ++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/lpeg-patterns/Config.in
>  create mode 100644 package/lpeg-patterns/lpeg-patterns.hash
>  create mode 100644 package/lpeg-patterns/lpeg-patterns.mk

Thanks, but according to the Buildroot manual, all Lua packages must
now start with "lua", i.e lualpeg-patterns or perhaps preferably
lua-lpeg-patterns.

See also commit 75cf694bb0892186a68bd954cef82922d825ca6f from Arnout.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
