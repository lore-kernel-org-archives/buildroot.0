From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 21:54:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/libupnp: set
 LIBUPNP_CPE_ID_VALID
In-Reply-To: <CAPi7W82nk3xp-S6pNS+Sy1smwj4YxfAtO_s-JhDSutOdtaDcVQ@mail.gmail.com>
References: <20210111201441.1414609-1-fontaine.fabrice@gmail.com>
 <20210111213703.72b52be4@windsurf.home>
 <CAPi7W82nk3xp-S6pNS+Sy1smwj4YxfAtO_s-JhDSutOdtaDcVQ@mail.gmail.com>
Message-ID: <20210111215454.29ffdfdd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Jan 2021 21:41:34 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> I sent a patch serie in September to bump libupnp to the latest version:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=198748
> 
> I think it should be reviewed and applied especially because libupnp
> 1.6 and 1.8 are old and vulnerable to Call Stranger.

Ah right. I was also surprised when I saw libupnp/libupnp18, as I
remember seeing patches that were finally resolving this annoyance. But
seems like indeed those patches have not yet been reviewed/applied. We
should get to that, I guess!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
