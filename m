From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 15:36:27 +0200
Subject: [Buildroot] [PATCH 1/3] python: new module flup
In-Reply-To: <1401006257-10688-1-git-send-email-oli.vogt.pub01@gmail.com>
References: <1401006257-10688-1-git-send-email-oli.vogt.pub01@gmail.com>
Message-ID: <20140727153627.1f67f576@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear oli vogt,

On Sun, 25 May 2014 20:24:17 +1200, oli vogt wrote:
> This module is useful to implement a fastCGI webserver
> Tested with ARM and Python 2.7.6
> 
> Signed-off-by: oli vogt <oli.vogt.pub01@gmail.com>
> ---
>  package/Config.in                  |  1 +
>  package/python-flup/Config.in      |  9 +++++++++
>  package/python-flup/python-flup.mk | 15 +++++++++++++++
>  3 files changed, 25 insertions(+)
>  create mode 100644 package/python-flup/Config.in
>  create mode 100644 package/python-flup/python-flup.mk

Thanks, applied. However, I've changed the license from 'BSD-4c, MIT'
to just 'BSD-2c'. Let me know if you believe this is wrong, but it
seemed to be matching what the package really uses.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
