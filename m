From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Dec 2016 12:08:00 +0100
Subject: [Buildroot] wvdial fails reading contents of wvdial.conf
In-Reply-To: <AM5P195MB0049E089BF7AC66DD623F208B2980@AM5P195MB0049.EURP195.PROD.OUTLOOK.COM>
References: <AM5P195MB0049E089BF7AC66DD623F208B2980@AM5P195MB0049.EURP195.PROD.OUTLOOK.COM>
Message-ID: <20161212120800.4768c191@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Dec 2016 08:33:44 +0000, Mathijs Jonker wrote:

> I'm having an issue with wvdial being unable to read the config. It's finding the correct file and has found all the needed libraries.
> 
> Platform is CM-FX6 (iMX6) using a custom kernel 3.0.35, buildroot version 2016.08.1.

The wvdial package has been removed as of Buildroot 2016.11. See commit
521cf82ad842e019c07e3a0d1c0c29c09ae00776 that explains why we removed
it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
