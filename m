From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 21:16:34 +0200
Subject: [Buildroot] [PATCH 1/3] python-argh: new package
In-Reply-To: <1462515686-26545-1-git-send-email-yegorslists@googlemail.com>
References: <1462515686-26545-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160531211634.52b7169e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 May 2016 08:21:24 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                    |  1 +
>  package/python-argh/Config.in        |  6 ++++++
>  package/python-argh/python-argh.hash |  4 ++++
>  package/python-argh/python-argh.mk   | 13 +++++++++++++
>  4 files changed, 24 insertions(+)
>  create mode 100644 package/python-argh/Config.in
>  create mode 100644 package/python-argh/python-argh.hash
>  create mode 100644 package/python-argh/python-argh.mk

I've added PYTHON_ARGH_LICENSE_FILES, pointing to README.rst, which
contains a reference to the license. Not perfect, but better than
nothing.

Applied to next with this change.

THanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
