From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 08:38:15 +0100
Subject: [Buildroot] [PATCH 44/58] python-pytrie: bump to version 0.3
In-Reply-To: <20170219191255.1503-45-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
 <20170219191255.1503-45-Adamduskett@outlook.com>
Message-ID: <20170303083815.08389de6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Feb 2017 14:12:41 -0500, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/python-pytrie/python-pytrie.hash | 6 +++---
>  package/python-pytrie/python-pytrie.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

This breaks the build:

  http://autobuild.buildroot.net/?reason=python-pytrie-0.3

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
