From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 10:35:47 +0100
Subject: [Buildroot] [PATCH v4] mtree: new package
In-Reply-To: <7f2ed921-9f36-0a2d-bf2d-53eb47841969@mind.be>
References: <20190326142411.6943-1-esben.haabendal@gmail.com>
 <20190327201803.6b1a832d@windsurf> <87bm1w9ck5.fsf@haabendal.dk>
 <20190328121441.02648d09@windsurf> <87tvfnav5a.fsf@gmail.com>
 <02a2e44d-45e9-f3fc-8c1f-5cf7a8b8f5d8@mind.be>
 <20190328210043.41fc2c0d@windsurf>
 <87ef6qlnow.fsf@dell.be.48ers.dk>
 <20190328225305.174d234e@windsurf>
 <7f2ed921-9f36-0a2d-bf2d-53eb47841969@mind.be>
Message-ID: <20190329103547.7b562561@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Mar 2019 10:31:22 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> >> I don't have a problem dropping support for ancient toolchains when they  
> 
>  The important thing to note is: we drop support for such ancient toolchains
> trying to build the mtree package.

Fair enough. So let's drop all these -U_FILE_OFFSET_BITS from all
packages that use this workaround, and add the corresponding
autobuilder exceptions in utils/genrandconfig.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
