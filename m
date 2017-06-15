From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 23:12:19 +0200
Subject: [Buildroot] [PATCH v4 1/7] package/python-traitlets: New package
In-Reply-To: <20170612234216.902-2-andrew.smirnov@gmail.com>
References: <20170612234216.902-1-andrew.smirnov@gmail.com>
 <20170612234216.902-2-andrew.smirnov@gmail.com>
Message-ID: <20170615231219.530631ea@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 16:42:10 -0700, Andrey Smirnov wrote:
> Add 'traitlets'[1] package to Buildroot. Needed by IPython.
> 
> [1] https://pypi.python.org/pypi/traitlets
> 
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  DEVELOPERS                                     |  1 +
>  package/Config.in                              |  1 +
>  package/python-traitlets/Config.in             | 10 ++++++++++
>  package/python-traitlets/python-traitlets.hash |  3 +++
>  package/python-traitlets/python-traitlets.mk   | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-traitlets/Config.in
>  create mode 100644 package/python-traitlets/python-traitlets.hash
>  create mode 100644 package/python-traitlets/python-traitlets.mk

Entire series applied. I fixed some minor nits along the way, I'll reply
to the individual patches about them.

Thanks a lot for this contribution!

What about adding a test in the runtime test infrastructure that
verifies that ipython runs fine with both python2 and python3 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
