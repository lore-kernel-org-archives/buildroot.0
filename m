From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 22:32:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-pycups: new package
In-Reply-To: <20200824214857.4090659-1-joseph.kogut@gmail.com>
References: <20200824214857.4090659-1-joseph.kogut@gmail.com>
Message-ID: <20201205223220.2f58c001@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Aug 2020 14:48:57 -0700
Joseph Kogut <joseph.kogut@gmail.com> wrote:

> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Applied to master, thanks, with one change. See below.

> +PYTHON_PYCUPS_LICENSE = GNU General Public License (GPL)

We use SPDX identifiers, so I've changed that to GPL-2.0+, after
checking that it was indeed that version of the license.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
