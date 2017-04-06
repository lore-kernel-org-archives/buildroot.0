From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:36:44 +0200
Subject: [Buildroot] [PATCH 1/1] libgphoto2: Add libgphoto2 package
In-Reply-To: <1491467592-21504-1-git-send-email-kevin.joly@sensefly.com>
References: <1491467592-21504-1-git-send-email-kevin.joly@sensefly.com>
Message-ID: <20170406223644.473ebd65@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 6 Apr 2017 10:33:12 +0200, Kevin JOLY wrote:
> Add support for libgphoto2 core library designed to allow access to digital camera.
> 
> Signed-off-by: Kevin JOLY <kevin.joly@sensefly.com>
> ---
>  DEVELOPERS                         |  3 +++
>  package/Config.in                  |  1 +
>  package/libgphoto2/Config.in       | 11 +++++++++++
>  package/libgphoto2/libgphoto2.hash |  6 ++++++
>  package/libgphoto2/libgphoto2.mk   | 29 +++++++++++++++++++++++++++++
>  5 files changed, 50 insertions(+)
>  create mode 100644 package/libgphoto2/Config.in
>  create mode 100644 package/libgphoto2/libgphoto2.hash
>  create mode 100644 package/libgphoto2/libgphoto2.mk

Thanks for this patch. However:

 - You already posted a patch for the same package on March, 13th, but
   you don't explain how this version is different. This patch is not
   even identified as a new iteration. What changed?

 - Romain Naour submitted on March 5 a patch adding libgphoto2, so your
   proposal seems a bit redundant with Romain's patch. Have you taken
   over Romain's patch? I'm adding Romain in Cc here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
