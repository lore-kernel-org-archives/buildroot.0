From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Apr 2021 14:18:07 +0200
Subject: [Buildroot] package: add kmscon
In-Reply-To: <XQTayAXJ0ouEvKU_bcf0tyt6DOSr7_rf8dmmfl2a69DXbglRV1NCkl0buP5dG9ag5D1-UeOQFi6XBAyQSmPFOUu6W3nrggufcZqjkctXEbM=@protonmail.com>
References: <XQTayAXJ0ouEvKU_bcf0tyt6DOSr7_rf8dmmfl2a69DXbglRV1NCkl0buP5dG9ag5D1-UeOQFi6XBAyQSmPFOUu6W3nrggufcZqjkctXEbM=@protonmail.com>
Message-ID: <20210403141807.69534733@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 03 Apr 2021 10:16:51 +0000
qblade via buildroot <buildroot@busybox.net> wrote:

> I added two packages, libtsm is a dependent library of kmscon.
> 
> kmscon does better than fbterm in 256color.
> 
> Multiple font engine support of kmscon will be added later, currently only unifont is supported.
> 
> I tested it on the following platforms and it works fine

Thanks a lot for your contribution! Could you use "git send-email" to
send your patches, so that each patch is a separate e-mail on the
mailing list, and we can do proper review on them ?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
