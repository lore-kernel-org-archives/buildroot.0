From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 22:03:44 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/python-filelock: new package
In-Reply-To: <20200323154539.39731-1-jared.bents@rockwellcollins.com>
References: <20200323154539.39731-1-jared.bents@rockwellcollins.com>
Message-ID: <20200324220344.2ca2e145@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Mar 2020 10:45:39 -0500
Jared Bents <jared.bents@rockwellcollins.com> wrote:

> This package contains a single module, which implements
> a platform independent file lock in Python, which provides
> a simple way of inter-process communication.
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> --
> v2: updated commit message to fit new package standard
> ---
>  DEVELOPERS                                   |  1 +
>  package/Config.in                            |  1 +
>  package/python-filelock/Config.in            |  6 ++++++
>  package/python-filelock/python-filelock.hash |  5 +++++
>  package/python-filelock/python-filelock.mk   | 14 ++++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-filelock/Config.in
>  create mode 100644 package/python-filelock/python-filelock.hash
>  create mode 100644 package/python-filelock/python-filelock.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
