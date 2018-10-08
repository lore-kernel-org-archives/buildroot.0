From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 18:09:13 +0200
Subject: [Buildroot] [PATCH v2] xapian: new package
In-Reply-To: <1538903821-5952-1-git-send-email-gilles.talis@gmail.com>
References: <1538903821-5952-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <20181008180913.234499a4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Oct 2018 11:17:01 +0200, Gilles Talis wrote:
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
> Change v1 -> v2
> - Fixed warnings reported by check-package script.

I've applied to master, after fixing the issues pointed by Matt:

    [Thomas:
     - add zlib to the DEPENDENCIES variable
     - add missing Config.in comment.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
