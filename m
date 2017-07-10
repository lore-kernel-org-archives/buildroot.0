From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Jul 2017 14:25:45 +0200
Subject: [Buildroot] [PATCH] i2c-tools: use upstream tarball
In-Reply-To: <20170710120307.owivm5mq6farxorr@sapphire.tkos.co.il> (Baruch
 Siach's message of "Mon, 10 Jul 2017 15:03:07 +0300")
References: <20170710113801.31752-1-peter@korsgaard.com>
 <20170710120307.owivm5mq6farxorr@sapphire.tkos.co.il>
Message-ID: <87pod8tr5i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Mon, Jul 10, 2017 at 01:38:01PM +0200, Peter Korsgaard wrote:
 >> Tarballs of the releases are now again available:
 >> 
 >> https://www.spinics.net/lists/linux-i2c/msg30349.html
 >> 
 >> So change back to that instead of getting the source code from git.
 >> 
 >> While we're at it, add a hash for the license file.

 > You can also update the Config.in homepage link:

 > https://i2c.wiki.kernel.org/index.php/I2C_Tools
 > https://www.spinics.net/lists/linux-i2c/msg30371.html

Correct, I've fixed that and applied, thanks!

-- 
Bye, Peter Korsgaard
