From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Apr 2018 14:45:10 +0200
Subject: [Buildroot] [PATCH v2] lz4: improve static only build support
In-Reply-To: <e5fee55fc78a363b247f0eb8594aa9f40d3a1526.1524199966.git.baruch@tkos.co.il>
References: <e5fee55fc78a363b247f0eb8594aa9f40d3a1526.1524199966.git.baruch@tkos.co.il>
Message-ID: <20180421144510.47a1ccf4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Apr 2018 07:52:46 +0300, Baruch Siach wrote:
> The current method of supporting static only build, removal of all lines
> that match the SHARED regex from lib/Makefile, is crude and fragile.
> Instead, patch lib/Makefile to allow disable of shared libraries.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Not sure if it is due to this patch or the one bumping to 1.8.1.2, but
lz4 now fails to build in some configurations:

  http://autobuild.buildroot.net/results/a8d/a8d956ff420f6a265c5c00b33646dbbc24ce2d48/build-end.log

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
