From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 22:31:43 +0200
Subject: [Buildroot] [PATCH] Adding in support for custom configurations
In-Reply-To: <1460734834-32123-1-git-send-email-patrick@stwcx.xyz>
References: <1460734834-32123-1-git-send-email-patrick@stwcx.xyz>
Message-ID: <20160417223143.0b54cce6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Apr 2016 10:40:34 -0500, Patrick Williams wrote:
> From: Elizabeth Liner <eliner@us.ibm.com>
> 
> This change will add in the custom _defconfig's to the buildroot
> makefile so that when a _defconfig is in the custom directory it is
> recognized correctly, and is able to be used.
> 
> Signed-off-by: Elizabeth Liner <eliner@us.ibm.com>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>

Like Steve replied, I don't see the usefulness for this patch. We
already allow custom configurations to be stored in
$(BR2_EXTERNAL)/configs/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
