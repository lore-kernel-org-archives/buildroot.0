From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 16:16:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: new package
In-Reply-To: <20191101080135.23413-1-james.hilliard1@gmail.com>
References: <20191101080135.23413-1-james.hilliard1@gmail.com>
Message-ID: <20200419161656.00eeb386@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Nov 2019 02:01:35 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

This package fails to build on a number of CPU architectures:

  http://autobuild.buildroot.net/?reason=python-greenlet%

It seems like it contains some architecture-specific code, as it fails
like this:

greenlet.c:347:2: error: #error "greenlet needs to be ported to this platform, or teached how to detect your compiler properly."

Could you have a look ?

Are you receiving daily e-mail with the build failures that occur for
the packages you are listed for in the DEVELOPERS file ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
