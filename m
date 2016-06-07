From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 22:47:44 +0200
Subject: [Buildroot] [PATCH v6 3/3] docker-engine: new package
In-Reply-To: <59dc9de3a6b14bf5be1c61368dc0cbde@WEBMAIL.arcx.com>
References: <1464475578-22239-1-git-send-email-christian@paral.in>
 <1464475578-22239-4-git-send-email-christian@paral.in>
 <f27fd228ed034bc499fe1c69ac9a3980@WEBMAIL.arcx.com>
 <20160607215439.76ad85ee@free-electrons.com>
 <CA+h8R2oZypDvm65RVp3fNX1MYCxSWqX95MxLW-q-K25d4tNccg@mail.gmail.com>
 <59dc9de3a6b14bf5be1c61368dc0cbde@WEBMAIL.arcx.com>
Message-ID: <20160607224744.5ed22c32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Jun 2016 20:37:51 +0000, Andrew Webster wrote:

> > Certs are a different story but that might be out of the scope of
> > the Docker package. It can run stuff locally without hitting the
> > internet at all.  
> 
> Yup.  I guess there's no formal way to "recommend" a package.

The best thing we can do in the context of Buildroot is to add a note
in the help text of the package in its Config.in file.

Something like:

	  Make sure to enable the ca-certificates package if you want
	  docker-engine to be able to ....

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
