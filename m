From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 11:42:32 +0100
Subject: [Buildroot] [PATCH 1/1] Added local directory as source of
 kernel code
In-Reply-To: <4eec3fe6-b078-90a2-ceec-c91d97715e8e@mind.be>
References: <20181107100605.13141-1-nicolas.carrier@orolia.com>
 <CANQCQpb6BYDMXJTDKEXKgpmBG1jHjOt2G1_eDF_cSVbCM=x=nw@mail.gmail.com>
 <PR1PR06MB49557D35D7EB1F1D03DEFDD784C40@PR1PR06MB4955.eurprd06.prod.outlook.com>
 <20181107174411.0b67a064@windsurf> <20181107185226.GB4702@scaer>
 <4eec3fe6-b078-90a2-ceec-c91d97715e8e@mind.be>
Message-ID: <20181108114232.6675488f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 7 Nov 2018 22:26:50 +0100, Arnout Vandecappelle wrote:

> 3. Add an addition config option that points to a directory, where each
> subdirectory will be treated as a local override for a package with that name.
> Similar to BR2_GLOBAL_PATCH_DIR.

This is pretty nice, I like this idea.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
