From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Wed, 1 Aug 2007 16:21:37 +0200 (CEST)
Subject: [Buildroot] touch menuconfig
In-Reply-To: <028101c7d412$68153a70$dcc4af0a@atmel.com>
References: <016801c7d404$a2834ca0$dcc4af0a@atmel.com>
	<28024.24.217.29.51.1185951980.squirrel@kujawski.org>
	<028101c7d412$68153a70$dcc4af0a@atmel.com>
Message-ID: <0708011538240.1707@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 1 Aug 2007, Ulf Samuelsson wrote:

> "make menuconfig" starts the configuration, but linking it to
> docs/README obviously improves the usability.

In that case it would be more intuitive to symlink:

  README -> docs/README

> Anyone else?

Yes. Please don't do confusing things like that and clutter the name
space more than necessary.

If it's command completion you're looking for write something about
that in the docs-directory.

Debian, for example, distributes /etc/bash_completion. And that's
215907 bytes completion worth :)
Similar for zsh. For example, the directory:

  /usr/share/zsh/4.3.2/functions/Completion/Unix

has a lot of those.


Cheers,

-- 
Cristian
