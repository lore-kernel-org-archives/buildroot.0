From: Floris Bos <bos@je-eigen-domein.nl>
Date: Wed, 06 Feb 2013 15:25:43 +0100
Subject: [Buildroot] [PATCH] New host package: sunxi-tools
In-Reply-To: <20130206145604.7ae023bd@skate>
References: <1360158308-16233-1-git-send-email-bos@je-eigen-domein.nl>
 <20130206145604.7ae023bd@skate>
Message-ID: <511267E7.6080603@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/06/2013 02:56 PM, Thomas Petazzoni wrote:
> I think it should be noted somewhere that those tools are needed for 
> the non-mainline Linux kernel for Allwinner SoCs, which has chosen to 
> use completely non-standard mechanisms for board definition files and 
> pinmuxing description.

The description already mentions it is for the linux-sunxi kernel.
Could add the word "non-mainline" though, to avoid confusion.

> The mainline Linux effort does not require those specific tools.

Yes, but while I applaud the mainline effort, it should be noted that 
lack of MMC/NAND/USB/framebuffer support in the mainline kernel makes it 
not useful to the average user yet at this stage.


Yours sincerely,

Floris Bos
