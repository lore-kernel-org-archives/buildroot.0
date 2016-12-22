From: James Knight <james.knight@rockwellcollins.com>
Date: Thu, 22 Dec 2016 15:40:07 -0500
Subject: [Buildroot] [PATCH 1/2] net-tools: bump version to ea3935
In-Reply-To: <20161222202939.oqqb3de3yy6c5mqm@tarshish>
References: <20161222200218.15052-1-james.knight@rockwellcollins.com>
 <20161222202939.oqqb3de3yy6c5mqm@tarshish>
Message-ID: <CALe+oY9AJBO0k=oSZ5=20LUKGtBRF0W6B75u5V=q=PuqNrSAGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Thu, Dec 22, 2016 at 3:29 PM, Baruch Siach <baruch@tkos.co.il> wrote:
>
> These commits seem to conflict with
> 0002-iptunnel.c-do-not-include-netinet-ip.h.patch.

Gah! Seems when I synchronized my net-tools package I only checked the
history on the `net-tools.mk` file instead of the `net-tools` package
itself. This made my overlook Vicente's existing commits (which assume
are the patches which have been pulled upstream now). My bad.

If desired, I could queue up a proper commit which bumps the version
hash and properly drops the already-pulled patches (with some addition
checks). For now I'll just mark the patches as rejected.
