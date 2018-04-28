From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 21:49:56 +0200
Subject: [Buildroot] [PATCH 1/1] .gitignore: ignore outgoing directory
In-Reply-To: <20180428165522.GB2922@scaer>
References: <20180308142907.3006-1-chrismcc@gmail.com>
 <20180422080532.GG12688@scaer> <20180428184458.310770ce@windsurf>
 <20180428165522.GB2922@scaer>
Message-ID: <20180428214956.1eaff29f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Apr 2018 18:55:22 +0200, Yann E. MORIN wrote:

> > It's only the Buildroot manual that suggests to put them in an
> > outgoing/ folder (I'm not sure why).  
> 
> And I'm not even sure why we even creat the patches locally, when it is
> perfectly possible to send them directly, e.g. to send the last three
> patches:
> 
>     git send-email --to buidlroot at buildroot.org HEAD^^^..

I think for people beginning with git and patches, it is good to use
format-patch, so that you can check what the patches look like before
sending them.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
