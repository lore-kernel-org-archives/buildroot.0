From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Sep 2018 20:42:30 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-09-12
In-Reply-To: <CAB0FRsvZO7F8okh-mANVB34-Oqz9zXVm+Oxzkhc6apVM-=gySQ@mail.gmail.com>
References: <20180913060038.91A2A203DC@mail.bootlin.com>
 <CAB0FRsvZO7F8okh-mANVB34-Oqz9zXVm+Oxzkhc6apVM-=gySQ@mail.gmail.com>
Message-ID: <20180913204230.672b3fcc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Sep 2018 20:38:56 +0200, Fran?ois Perrad wrote:

> You must revert my 2 last commits about pkg-perl.mk
> https://git.busybox.net/buildroot/commit/?id=e58e19a9ec1dc1a6900063c43aa9d32b6578ecf8
> https://git.busybox.net/buildroot/commit/?id=ae94fff1c5695b4efcab0aed69212476be85fb52
> 
> When PERL_INC is set in the configure step with a path to STAGING_DIR,
> the generated Makefile (used by the build step) contains in fact a PERL_INC
> with a path to HOST_DIR.

Could you send a single patch reverting both, with an appropriate
commit log explaining the issue ?

I assume this may also fix the perl-crypto-blowfish issues ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
