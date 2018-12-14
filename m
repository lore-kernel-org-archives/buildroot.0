From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Dec 2018 22:52:44 +0100
Subject: [Buildroot] [PATCH] libssh: workaround -Werror=strict-overflow
 build failures
In-Reply-To: <7d6e364ac220c937573e1d4d7717a72cc240f81b.1544534379.git.baruch@tkos.co.il>
References: <7d6e364ac220c937573e1d4d7717a72cc240f81b.1544534379.git.baruch@tkos.co.il>
Message-ID: <20181214225244.41e3b69c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Dec 2018 15:19:39 +0200, Baruch Siach wrote:
> Add a patch that disables -Werror=strict-overflow to fix the build with
> some versions of gcc.
> 
> Fixes:
> http://autobuild.buildroot.net/results/414/41490ebb181762d14c565effb0155db7ac1e0db0/
> http://autobuild.buildroot.net/results/3a6/3a6395fd85f434ff855d602949166d5cec725c7e/
> http://autobuild.buildroot.net/results/224/22422145e7fc9a8ab4e766b174a916e599845f1c/
> 
> Cc: Scott Fan <fancp2007@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

What about not using -Werror instead?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
