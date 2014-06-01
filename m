From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jun 2014 12:57:09 +0200
Subject: [Buildroot] [PATCH v4 02/11] pkg-cmake.mk: do not hardcode
 absolute path in toolchainfile.cmake
In-Reply-To: <1401614673-3703-3-git-send-email-s.martin49@gmail.com>
References: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
 <1401614673-3703-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20140601125709.4ee4e631@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  1 Jun 2014 11:24:24 +0200, Samuel Martin wrote:
> The patch allows sharing or moving the toolchains.
> 
> This is a step toward making the toolchain/sdk relocatable.
> 
> Closes #6818
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Uwe Strempel <u.strempel@googlemail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> +# In all the other variables that need to refer to HOST_DIR will use
> +# the RELOCATED_HOST_DIR variable.

There's a typo in this sentence. Either:

"""
All the other variables that need to refer to HOST_DIR will use the
RELOCATED_HOST_DIR variable.
"""

or

"""
In all the other variables that need to refer to HOST_DIR, we'll use
the RELOCATED_HOST_DIR variable.
"""

But hopefully Peter can fix this while applying.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
