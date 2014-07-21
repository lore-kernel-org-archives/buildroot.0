From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 22:58:22 +0200
Subject: [Buildroot] [PATCH v2 1/1] package: remove the trailing slash
 sign from $(PKG)_SITE variable
In-Reply-To: <1379658454-6906-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1379658454-6906-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20140721225822.34be99b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Fri, 20 Sep 2013 08:27:34 +0200, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> 
> Since the trailing slash is stripped from $($(PKG)_SITE) by pkg-generic.mk:
> 
> $(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE))
> 
> so it is redundant.
> This patch removes it from $(PKG)_SITE variable for BR consistency.

Since this patch has been around for quite some time now, it no longer
applies properly, so I've marked it as "Changes Requested" in our patch
tracking system.

I don't know if it's worth respining the patch. What do we want to do
regarding this? Yann, Arnout, an opinion?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
