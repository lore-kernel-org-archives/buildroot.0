From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 22:03:41 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/python-pysftp: new package
In-Reply-To: <20200323154009.39402-1-jared.bents@rockwellcollins.com>
References: <20200323154009.39402-1-jared.bents@rockwellcollins.com>
Message-ID: <20200324220341.1fc3026c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Mar 2020 10:40:09 -0500
Jared Bents <jared.bents@rockwellcollins.com> wrote:

> A simple interface to SFTP. The module offers high level
> abstractions and task based routines to handle your SFTP
> needs.
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> ---
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/python-pysftp/Config.in          |  7 +++++++
>  package/python-pysftp/python-pysftp.hash |  5 +++++
>  package/python-pysftp/python-pysftp.mk   | 14 ++++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/python-pysftp/Config.in
>  create mode 100644 package/python-pysftp/python-pysftp.hash
>  create mode 100644 package/python-pysftp/python-pysftp.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
