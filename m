From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 08:39:30 +0100
Subject: [Buildroot] [PATCH 06/58] python-cherrypy: bump to version
 10.1.1
In-Reply-To: <20170219191255.1503-7-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
 <20170219191255.1503-7-Adamduskett@outlook.com>
Message-ID: <20170303083930.028e09dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Feb 2017 14:12:03 -0500, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/python-cherrypy/python-cherrypy.hash | 6 +++---
>  package/python-cherrypy/python-cherrypy.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

This breaks the build:

  http://autobuild.buildroot.net/?reason=python-cherrypy-10.1.1

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
