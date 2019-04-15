From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 14:23:50 +0200
Subject: [Buildroot] [PATCH 09/12 v2] core: introduce new global
 show-info
In-Reply-To: <357abbd3-e69f-1756-2112-587e9e8c850e@mind.be>
References: <cover.1555273025.git.yann.morin.1998@free.fr>
 <e0509e7ca0439176b7f483afb7436bb85c4fbed3.1555273025.git.yann.morin.1998@free.fr>
 <357abbd3-e69f-1756-2112-587e9e8c850e@mind.be>
Message-ID: <20190415142350.22f4d9bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Apr 2019 14:17:13 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  However, I'm actually dreaming of making the license statement a SPDX
> expression instead of a list (i.e. conjoined with AND and OR, and with
> parenthesis; unfortunately, SPDX has no syntax to express that it only applies
> to a part, e.g. GPL (programs) is not valid SPDX). Then it is no longer a list.
> 
>  And we should make a decision now, we're defining "userspace ABI" here so it's
> difficult to switch the string to a list or vice versa later.

Well, you can always have "licenses" be a string corresponding directly
to <pkg>_LICENSES as proposed by Yann, and if later on we feel like
having the same information in a different format is useful as a list,
we could introduce a separate "licenses-list" JSON property.

It is not nice, but it illustrates that even though we are defining
userspace ABI, it doesn't mean that we have to find the perfect
solution right now.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
