From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 13 Mar 2015 09:00:34 +0000
Subject: [Buildroot] [PATCH] ARC: bump tools to 2014.12 release
In-Reply-To: <03223383-0BA2-4CEE-8B8C-DF1F0F224C38@openwide.fr>
References: <1422879584-18485-1-git-send-email-abrodkin@synopsys.com>
 <20150304120358.591484a9@free-electrons.com>
 <1426231128.2836.13.camel@synopsys.com>
 <03223383-0BA2-4CEE-8B8C-DF1F0F224C38@openwide.fr>
Message-ID: <1426237234.2836.25.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2015-03-13 at 09:19 +0100, Romain Naour wrote:
> Hi Alexey,
> Can you have a look at this patch:
> https://patchwork.ozlabs.org/patch/449686/
> 
> The issue seem to be related to avr32 removal.

Strange enough I got everything built even from the same git snapshot as
it was in autobuilder.

That means I cannot really test proposed patch - it won't fix anything
for me because everything works already.

The only reason I may think of for that difference in behavior is host
gcc version. I'm on 64-bit Fedora 21 with gcc 4.9.2:
 --->8---
 gcc version 4.9.2 20150212 (Red Hat 4.9.2-6) (GCC)
 --->8---

Romain, Thomas what host gcc you/autobuilder use?

-Alexey
