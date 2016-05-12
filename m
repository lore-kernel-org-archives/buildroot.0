From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 May 2016 15:55:54 +0200
Subject: [Buildroot] [PATCH] Support nested config directories
In-Reply-To: <1463019163-27543-1-git-send-email-patrick@stwcx.xyz>
References: <1460734834-32123-1-git-send-email-patrick@stwcx.xyz>
 <1463019163-27543-1-git-send-email-patrick@stwcx.xyz>
Message-ID: <20160512155554.2add30bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 May 2016 21:12:43 -0500, Patrick Williams wrote:
> From: Elizabeth Liner <eliner@us.ibm.com>
> 
> Adds an additional recipe to search configs/*/ for defconfig files.
> Recipe added for both $(TOPDIR) and $(BR2_EXTERNAL) to allow nested
> directories for both locations.
> 
> Signed-off-by: Elizabeth Liner <eliner@us.ibm.com>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>

I believe this would not work well without changes if we were to merge
something like https://patchwork.ozlabs.org/patch/619719/ (which allows
to generate defconfig from fragments).

Could you work with your IBM colleagues to have a solution that works
for both use cases?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
