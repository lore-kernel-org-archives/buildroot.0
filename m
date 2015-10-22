From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 22 Oct 2015 23:24:49 +0200
Subject: [Buildroot] syslog-ng build failures
In-Reply-To: <CAFOYHZA=ujev-79kRHw7sFN9hRAikGsXtTC+fJbhyyMyFcFmTg@mail.gmail.com>
References: <CAFOYHZA=ujev-79kRHw7sFN9hRAikGsXtTC+fJbhyyMyFcFmTg@mail.gmail.com>
Message-ID: <20151022212449.GN21428@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Chris,
Chris Packham wrote,

> I've sent patches for some of the syslog-ng failures. The last one is
> http://autobuild.buildroot.net/results/137/137c6d5ef82f3a92f87bc2b3e285df548ca68654/
> 
> This appears to be because posix_spawnp and the others aren't
> available with that configuration of uclibc (although it looks like
> UCLIBC_HAS_ADVANCED_REALTIME is defined).
> 
> I could add --disable-amqp if we're using uclibc but that seems overly
> severe. Any better suggestions?

The output is quieten, so I am not sure, but may be an explictely
-lrt would help here?

best regards
 Waldemar
