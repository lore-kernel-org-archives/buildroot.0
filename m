From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 23:21:21 +0100
Subject: [Buildroot] [PATCH v2,1/2] cjson: bump to version v1.0.1
In-Reply-To: <1479662545-64029-1-git-send-email-fabrice.fontaine@orange.com>
References: <1479662545-64029-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161121232121.56e3bc6e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Nov 2016 18:22:24 +0100, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

An empty commit log for something that is clearly not a bump is not
good. You should explain that the project site has moved, why
BR2_STATIC_LIBS is OK, that it has changed to use cmake, etc.

Also your PATCH 2/2, also if it affects another package, should be
merged into PATCH 1/2. Indeed, if I ever apply PATCH 1/2 but not PATCH
2/2, tinycbor will not build.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
