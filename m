From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jan 2020 09:39:05 +0100
Subject: [Buildroot] [PATCH] package/python-pillow: bump to version
 6.2.2/7.0.0
In-Reply-To: <20200114091526.126189da@windsurf> (Thomas Petazzoni's message of
 "Tue, 14 Jan 2020 09:15:26 +0100")
References: <20200113222430.5157-1-angelo@amarulasolutions.com>
 <20200114091526.126189da@windsurf>
Message-ID: <87lfq3rgba.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Mon, 13 Jan 2020 23:24:30 +0100
 > Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

 >> This patch bumps Pillow to version 7.0.0 for Python3 and version
 >> 6.2.2 for Python2.
 >> Different versions here are needed cause the latest 7.0.0 only
 >> supports Python3, while support for Python2 is available in 6.2.2.
 >> 
 >> It updates also the LICENSE hash due to copyright year update.
 >> 
 >> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 >> ---
 >> I don't really know if this is the correct way to support two versions
 >> of the same package, please let me know.

 > If the latest version only supports Python 3.x, then only support this
 > version, and make it "depends on BR2_PACKAGE_PYTHON3". Python 2.x is
 > now considered deprecated by the upstream Python developers. I don't
 > think Buildroot should bother with keeping old Python modules around
 > just for the sake of Python 2.x compatibility.

Agreed!

-- 
Bye, Peter Korsgaard
