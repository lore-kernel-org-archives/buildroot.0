From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 22:02:15 +0200
Subject: [Buildroot] [PATCH 1/6] package/python-colorama: new package
In-Reply-To: <20190531171654.17906-1-matthew.weber@rockwellcollins.com>
References: <20190531171654.17906-1-matthew.weber@rockwellcollins.com>
Message-ID: <20190620220215.124ce75e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 May 2019 12:16:49 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> This package provides a simple cross-platform API for printing
> colored terminal text.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  DEVELOPERS                                   |  1 +
>  package/Config.in                            |  1 +
>  package/python-colorama/Config.in            |  6 ++++++
>  package/python-colorama/python-colorama.hash |  5 +++++
>  package/python-colorama/python-colorama.mk   | 14 ++++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-colorama/Config.in
>  create mode 100644 package/python-colorama/python-colorama.hash
>  create mode 100644 package/python-colorama/python-colorama.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
