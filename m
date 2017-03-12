From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 23:36:44 +0100
Subject: [Buildroot] [PATCH 2/3] package/nodejs: bump version to 7.7.1
In-Reply-To: <1488671310-27378-2-git-send-email-martin@barkynet.com>
References: <1488671310-27378-1-git-send-email-martin@barkynet.com>
 <1488671310-27378-2-git-send-email-martin@barkynet.com>
Message-ID: <20170312233644.1006d0ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Mar 2017 23:48:29 +0000, Martin Bark wrote:
> See https://nodejs.org/en/blog/release/v7.7.1/
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

This patch breaks the build with nodejs 0.10, because nodejs 0.10 does
not have this mkpeephole binary. Therefore, your PATCH 3/3 should be
before PATCH 2/3.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
