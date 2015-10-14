From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 10:01:47 +0200
Subject: [Buildroot] [PATCHv2] syslog-ng: New package
In-Reply-To: <CAFOYHZAJqOSLXBLZGKwsuATW4aGbrjSuK=n+dC4LAt2AY7CKyA@mail.gmail.com>
References: <1444808488-3387-1-git-send-email-judge.packham@gmail.com>
 <20151014095043.74e4285c@free-electrons.com>
 <CAFOYHZAJqOSLXBLZGKwsuATW4aGbrjSuK=n+dC4LAt2AY7CKyA@mail.gmail.com>
Message-ID: <20151014100147.205b90f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Packham,

On Wed, 14 Oct 2015 20:58:49 +1300, Chris Packham wrote:

> > This seems a bit weird. What needs to be uninstalled ?
> 
> There are a bunch of configuration files installed by default. Some of
> which rely on "optional" features (json was the one that stopped
> syslog-ng from starting). Technically since I'm installing a custom
> config file they won't do any harm but then they're just sitting there
> in the file system doing nothing.

OK. Can you simply copy/paste this explanation in a comment above the
fixup commands?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
