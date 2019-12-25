From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Dec 2019 23:32:30 +0100
Subject: [Buildroot] [PATCH 1/2] package/postgresql: explicitly use
 en_US.UTF-8 locale for initdb
In-Reply-To: <20191121101538.6788-1-p.debruijn@unilogic.nl>
References: <20191121101538.6788-1-p.debruijn@unilogic.nl>
Message-ID: <20191225233230.0648414e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pascal,

On Thu, 21 Nov 2019 11:15:38 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> From: Pascal de Bruijn <pmjdebruijn@pcode.nl>
> 
> postgres[290]: initdb: error: invalid locale settings; check LANG and LC_* environment variables
> postgres[290]: pg_ctl: database system initialization failed
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>

Following the feedback from Peter Seiderer on both patches, I marked
them as "Changes Requested" in patchwork. Could you reply to Peter's
comments, or resend updated patches ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
