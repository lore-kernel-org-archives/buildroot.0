From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 22:22:19 +0100
Subject: [Buildroot] [PATCH 1/1] json for modern cpp: fix license hash
In-Reply-To: <20180212172748.13563-1-aduskett@gmail.com>
References: <20180212172748.13563-1-aduskett@gmail.com>
Message-ID: <20180213222219.6ee93e07@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Feb 2018 12:27:48 -0500, Adam Duskett wrote:
> Fixes:
> http://autobuild.buildroot.net/results/942/942485b94f21567c2f35a1a3cc62450f3461a4f9
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Two nits with your patch:

 - The title should contain the package name, i.e json-for-modern-cpp

 - More importantly, you should have said this is material for next.
   Use git format-patch --subject-prefix="PATCH next" when creating
   patches intended for the next branch.

Applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
