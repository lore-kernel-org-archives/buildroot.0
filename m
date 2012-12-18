From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Dec 2012 10:24:24 +0100
Subject: [Buildroot] [PATCH] libseccomp: Remove the use of /proc when
 installing pc files
In-Reply-To: <1355822075-25703-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1355822075-25703-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <20121218102424.4ffe1ab2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On Tue, 18 Dec 2012 10:14:35 +0100, Maxime Ripard wrote:
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

This patch fixes
http://autobuild.buildroot.org/results/d9e12bb0f5b2df9064adf3772bcf479b51d72468/build-end.log

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
