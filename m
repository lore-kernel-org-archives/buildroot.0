From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 15:58:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-dataproperty: bump to
 version 0.48.1
In-Reply-To: <20200416104957.89939-1-james.hilliard1@gmail.com>
References: <20200416104957.89939-1-james.hilliard1@gmail.com>
Message-ID: <20200419155804.333e7c76@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Apr 2020 04:49:57 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Commit hash change is due to line endings change not in upstream
> git repo.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-dataproperty/python-dataproperty.hash | 6 +++---
>  package/python-dataproperty/python-dataproperty.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

This breaks the build, because python-dataproperty is Python 3.x only now:

  https://github.com/thombashi/DataProperty/commit/d3fdde41af0151e2f04a3a79bea1fb33a28a98f7#diff-2eeaed663bd0d25b7e608891384b7298

Build issue:

  http://autobuild.buildroot.net/results/c5b/c5bc5036b950e0a775a62fbf32f2315954a236a5/build-end.log

Could you send a patch that adds the Python 3.x to python-dataproperty,
and all its reverse dependencies ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
