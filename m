From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Feb 2018 23:18:26 +0100
Subject: [Buildroot] [NEXT 20/26] linux: add CPE id
In-Reply-To: <1519697441-54194-21-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-21-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180227231826.79f1bdec@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Feb 2018 20:10:35 -0600, Matt Weber wrote:

> +LINUX_CPE_ID = $(LINUX_NAME):$(LINUX_NAME)_kernel:$(LINUX_VERSION)

How is the CPE database reacting when LINUX_VERSION is some random Git
SHA1, from a private Git tree that nobody has access to ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
