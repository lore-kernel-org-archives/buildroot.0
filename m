From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2016 12:43:38 +0100
Subject: [Buildroot] [PATCH v2 08/15] reproducible: lock modification
 times in $TARGET_DIR
In-Reply-To: <1479460224-6119-9-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-9-git-send-email-jezz@sysmic.org>
Message-ID: <20161118124338.3168b4de@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 10:10:17 +0100, J?r?me Pouiller wrote:
> Make sure all files in $TARGET_DIR has a defined modification time before to

has -> have

> generate filesystems.
> 
> This work was sponsored by `BA Robotic Systems'.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Same: I'll apply soon if nobody complains.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
