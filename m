From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 08:38:57 +0100
Subject: [Buildroot] [PATCH 32/58] python-pyasn: bump to version 1.6.0b1
In-Reply-To: <20170219191255.1503-33-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
 <20170219191255.1503-33-Adamduskett@outlook.com>
Message-ID: <20170303083857.09ebda58@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Feb 2017 14:12:29 -0500, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/python-pyasn/python-pyasn.hash | 6 +++---
>  package/python-pyasn/python-pyasn.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

This breaks the build:

   http://autobuild.buildroot.net/?reason=python-pyasn-1.6.0b1

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
