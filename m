From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 22:42:17 +0200
Subject: [Buildroot] [PATCH v3 2/3] python-networkx: new package
In-Reply-To: <1521578383-56128-2-git-send-email-jared.bents@rockwellcollins.com>
References: <1521578383-56128-1-git-send-email-jared.bents@rockwellcollins.com>
 <1521578383-56128-2-git-send-email-jared.bents@rockwellcollins.com>
Message-ID: <20180325224217.6c7ec895@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Mar 2018 15:39:42 -0500, Jared Bents wrote:
> Update to add python-networkx package to buildroot. While 2.1
> is the latest version, the current version of setools does not
> work with versions past 1.11.
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> --
> v2 -> v3: Update to remove target dependencies but kept the
>           host package dependency as it is required for
>           host-python-decorator to be built and thus available
>           at runtime
> v1 -> v2: Update to add version dependency to networkx mk file
> 
> ---
>  package/Config.in                            |  1 +
>  package/python-networkx/Config.in            |  9 +++++++++
>  package/python-networkx/python-networkx.hash |  4 ++++
>  package/python-networkx/python-networkx.mk   | 17 +++++++++++++++++
>  5 files changed, 32 insertions(+)
>  create mode 100644 package/python-networkx/Config.in
>  create mode 100644 package/python-networkx/python-networkx.hash
>  create mode 100644 package/python-networkx/python-networkx.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
