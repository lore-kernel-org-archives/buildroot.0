From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 17:51:46 +0200
Subject: [Buildroot] [PATCH 1/3] dropbear: Use macro to set options
In-Reply-To: <20180418142434.7268-1-stefan.sorensen@spectralink.com>
References: <20180418142434.7268-1-stefan.sorensen@spectralink.com>
Message-ID: <20180428175146.0d4d6406@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stefan,

On Wed, 18 Apr 2018 16:24:32 +0200, Stefan S?rensen wrote:
> Introduce a macro for editing options.h according to the Buildroot
> configuration, replacing individual sed scripts.
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

I have merged some patches from Fran?ois Perrad (submitted before your
series) that bump Dropbear to 2018.76. And the mechanism to tweak
options has changed quite a bit.

You now simply needs to add #define in a file called localoptions.h,
overriding the default option values.

Could you rebase your patch series on top of the latest dropbear
changes ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
