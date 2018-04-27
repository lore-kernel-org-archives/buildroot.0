From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Apr 2018 23:27:21 +0200
Subject: [Buildroot] [PATCH v2 4/5] python-visitor: new package
In-Reply-To: <20180206132506.30389-4-aduskett@gmail.com>
References: <20180206132506.30389-1-aduskett@gmail.com>
 <20180206132506.30389-4-aduskett@gmail.com>
Message-ID: <20180427232721.622080c4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Feb 2018 08:25:05 -0500, Adam Duskett wrote:
> A tiny library to facilitate visitor implementation in Python
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

This patch had some check-package warnings:

package/python-visitor/Config.in:2: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
package/python-visitor/Config.in:3: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
package/python-visitor/Config.in:4: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

I fixed them and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
