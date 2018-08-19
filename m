From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Aug 2018 23:25:23 +0200
Subject: [Buildroot] [PATCH/next 2/3] package/perl-crypt-openssl-random:
 bump version to 0.15
In-Reply-To: <20180819231557.62acd467@windsurf>
References: <20180819181558.15338-1-bernd.kuhls@t-online.de>
 <20180819181558.15338-2-bernd.kuhls@t-online.de>
 <20180819231557.62acd467@windsurf>
Message-ID: <20180819232523.42a4635f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 23:15:57 +0200, Thomas Petazzoni wrote:

> So, there's a new dependency on a module that helps guessing the path
> to OpenSSL library/headers, but you nonetheless have to force where
> they are located ? Seems strange :-)

In fact, more serious question: figuring out the path to OpenSSL
libs/headers is something that is needed at build time. But you're
adding perl-crypt-openssl-guess as a target package. I don't understand
how it makes sense. Could you clarify ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
