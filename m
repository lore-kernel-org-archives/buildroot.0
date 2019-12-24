From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 15:09:12 +0100
Subject: [Buildroot] [PATCH] [PATCH] package/tio: new package
In-Reply-To: <87h81p4zdz.fsf@tarshish>
References: <20191222221203.1990-1-sergio.prado@e-labworks.com>
 <20191223055102.lfw56utpgqalw2we@sapphire.tkos.co.il>
 <20191224141451.521e9123@windsurf> <87h81p4zdz.fsf@tarshish>
Message-ID: <20191224150912.3c0e0d7a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Dec 2019 15:38:32 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> > There was no file named "LICENSE" in the source code, so I'm not sure
> > what your suggestion was. Did you suggest to add README instead maybe ?  
> 
> Is see this here:
> 
>   https://github.com/tio/tio/blob/master/LICENSE
> 
> According to the log this file has been there since 2016.

It is not in the tarball as far as I can see:

$ tar tvf tio-1.32.tar.xz | grep LICENSE
$

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
