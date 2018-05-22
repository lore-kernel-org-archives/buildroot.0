From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 May 2018 23:00:33 +0200
Subject: [Buildroot] [PATCH] toolchain: GCC bug 85862
In-Reply-To: <1526934582-53824-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1526934582-53824-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180522230033.0daffecb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 May 2018 15:29:42 -0500, Matt Weber wrote:
> GCC < 7.x hangs while building libnss for the Microblaze Arch.
> 
> Discovered by
> http://autobuild.buildroot.net/results/158e8ebb39713e1b436a5cc1a1916f46c30694df
> 
> Reported:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85862
> 
> Simlar to:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=49218
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Beyond the libnss issue, we do have at least three other Microblaze timeouts. However, I think Romain Naour had identified a different issue for those:

http://autobuild.buildroot.net/?status=TIMEOUT&arch=microblazeel

Affected packages: flare-engine, boost, gst-ffmpeg.

Romain, Matt, would it be possible to make progress with those timeouts
as well ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
