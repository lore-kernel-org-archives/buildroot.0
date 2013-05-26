From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 May 2013 11:26:36 +0200
Subject: [Buildroot] [PATCH v7 01/10] libglib2: Bump libglib2 to 2.36.1
In-Reply-To: <1369177864-6236-2-git-send-email-spenser@gillilanding.com>
References: <1369177864-6236-1-git-send-email-spenser@gillilanding.com>
 <1369177864-6236-2-git-send-email-spenser@gillilanding.com>
Message-ID: <20130526112636.62707643@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Tue, 21 May 2013 18:10:55 -0500, Spenser Gilliland wrote:
> This patch bumps libglib2 to version 2.36.1. In addition this bumps glibmm and glib-networking to 2.36.1.

Due to cf81029c01650bc00b713e06dc7581f3f43767a0 libglib2: fix build
when toolchain has no thread support, this patch no longer applies
properly to the current master.

Also, this commit has added a new patch that ensures libglib2 builds
properly in a !thread environment, but this patch no longer applies to
the libglib2 sources.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
