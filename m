From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 15:02:53 +0200
Subject: [Buildroot] [PATCH v3 04/11] package/python-ipython-genutils:
 New package
In-Reply-To: <20170602235653.4655-5-andrew.smirnov@gmail.com>
References: <20170602235653.4655-1-andrew.smirnov@gmail.com>
 <20170602235653.4655-5-andrew.smirnov@gmail.com>
Message-ID: <20170611150253.6db39a0e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Jun 2017 16:56:46 -0700, Andrey Smirnov wrote:
> Add 'ipython_genutils'[1] package to Buildroot. Needed by 'traitlets'.
> 
> [1] https://pypi.python.org/pypi/ipython_genutils
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  DEVELOPERS                                                  |  1 +
>  package/Config.in                                           |  1 +
>  package/python-ipython-genutils/Config.in                   |  6 ++++++
>  .../python-ipython-genutils/python-ipython-genutils.hash    |  3 +++
>  package/python-ipython-genutils/python-ipython-genutils.mk  | 13 +++++++++++++
>  5 files changed, 24 insertions(+)
>  create mode 100644 package/python-ipython-genutils/Config.in
>  create mode 100644 package/python-ipython-genutils/python-ipython-genutils.hash
>  create mode 100644 package/python-ipython-genutils/python-ipython-genutils.mk

Applied to master, after doing the following changes:

    [Thomas: take into account comments made by Yegor:
     - fix alphabetic ordering in the DEVELOPERS file
     - fix comment in hash file
     - add license file]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
