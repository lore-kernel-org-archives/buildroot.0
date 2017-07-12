From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jul 2017 18:38:21 +0200
Subject: [Buildroot] [PATCH] python-hyperlink: new package
In-Reply-To: <20170712075743.15082-1-yegorslists@googlemail.com>
References: <20170712075743.15082-1-yegorslists@googlemail.com>
Message-ID: <20170712183821.5a4245be@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Jul 2017 09:57:43 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Though PyPI says the license is BSD, GitHub repo has an MIT license
> file since April 2017 and upstream setup.py was also fixed.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                              |  1 +
>  package/python-hyperlink/Config.in             |  6 ++++++
>  package/python-hyperlink/python-hyperlink.hash |  3 +++
>  package/python-hyperlink/python-hyperlink.mk   | 13 +++++++++++++
>  4 files changed, 23 insertions(+)
>  create mode 100644 package/python-hyperlink/Config.in
>  create mode 100644 package/python-hyperlink/python-hyperlink.hash
>  create mode 100644 package/python-hyperlink/python-hyperlink.mk

Applied to master, thanks. However, when you send individual patches,
make sure they applied on master. Indeed in this patch, the context
in package/Config.in referred to the python-hyperframe package, which
you submitted in a different patch series, that hasn't been merged yet.
This caused a conflict (admittedly minor and very easy to resolve) when
applying the patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
