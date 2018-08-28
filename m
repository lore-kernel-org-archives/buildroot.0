From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 22:28:07 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: security bump to 10.5
In-Reply-To: <20180828163127.9989-1-aduskett@gmail.com>
References: <20180828163127.9989-1-aduskett@gmail.com>
Message-ID: <20180828222807.1a3a747b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Aug 2018 12:31:27 -0400, Adam Duskett wrote:
> Fixes CVE-2018-10915 & CVE-2018-10925
> 
> Changelog: https://www.postgresql.org/docs/10/static/release-10-5.html
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

There should be one empty line before your SoB line, so I fixed that
up, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
