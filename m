From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 21:53:46 +0100
Subject: [Buildroot] [PATCH 1/2] Liblo : Disable werror
In-Reply-To: <1519569634-9096-1-git-send-email-alexbaldwinmusic@gmail.com>
References: <1519569634-9096-1-git-send-email-alexbaldwinmusic@gmail.com>
Message-ID: <20180225215346.730c3b0a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Feb 2018 15:40:33 +0100, Alex B wrote:
> From: Alex <alexbaldwinmusic@gmail.com>
> 
> Fixes :
> http://autobuild.buildroot.net/results/61ab7e23d2ef62f055efc74a998e3c108a3cdb43
> 
> Signed-off-by: Alex <alexbaldwinmusic@gmail.com>

I've applied your two patches to next, after fixing a number of minor
nits:

 - The commit title should be "<package>: <description>", with package
   in lower-case, and no space before the colon.

 - The author and Signed-off-by should have been your full first name +
   last name, like you did for your previous contributions.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
