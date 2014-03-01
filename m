From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 17:12:53 +0100
Subject: [Buildroot] [PATCH 00/24] lua
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140301171253.220ce620@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Mon, 24 Feb 2014 08:34:36 +0100, Francois Perrad wrote:

>   lpeg: new package
>   cosmo: new package

These two applied.

>   luajson: new package
>   lualogging: new package
>   dado: new package
>   lrandom: new package
>   lua-testmore: new package
>   lua-coat: new package
>   lua-coatpersistent: new package
>   lua-messagepack: new package
>   lua-csnappy: new package
>   lzlib: new package
>   lunit: new package
>   lpty: new package
>   lsqlite3: new package

All these applied.

If I'm correct the patches that remain to be applied are:

	[11/24] lua-iconv: new package

This one has questions from Arnout.

	[08/24] ljlinenoise: new package

Small comments from Arnout.

	[07/24] luarocks: allow to work with host-luajit

Comments from Arnout.

	[06/24] luajit: add host-luajit

Ditto.

	[05/24] luajit: refactor without shared-lib.patch

Some comments from Samuel, apparently you wanted to add another static
linking related patch to the series.

	[04/24] luajit: refactor without dont-strip.patch

Comments from Arnout.

Would you mind resending another series with those patches, taking into
account the comments?

Also, may I insist yet another time on the fact that your commit logs
are very often way too short. For anything that isn't a simple package
addition or bump, a good rule of thumb is that your commit log must
have at least 2 or 3 paragraphs detailing what's going on. If you don't
have 2 or 3 paragraphs for each of your commit logs, please re-read
them again and ask yourself whether the patch can easily be understood
by reviewers. If not, your commit log should be improved.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
