From: Pieter Smith <pieter@boesman.nl>
Date: Wed, 2 Mar 2016 08:54:08 +0100
Subject: [Buildroot] [v3,
 3/4] barebox: user selection of build output images
In-Reply-To: <56D62247.8000500@mind.be>
References: <1453329821-3167-1-git-send-email-pieter@boesman.nl>
 <1453329821-3167-4-git-send-email-pieter@boesman.nl>
 <56D0E32C.3050207@mind.be> <20160229083817.GC18059@smipidev>
 <56D62247.8000500@mind.be>
Message-ID: <20160302075408.GB10481@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 02, 2016 at 12:14:15AM +0100, Arnout Vandecappelle wrote:
> On 02/29/16 09:38, Pieter Smith wrote:

[snip]

> > 
> > ACK. Done. I solved this with the above default and help text pointing the user
> > to use 'barebox.bin' for older versions. I'm just waiting for Yegor, and then
> > I'll repost.
> > 
> > Right now a user-friendly warning is generated if an old config is used and
> > this config item has not yet been set. 
> 
>  If you give it a default value, it _will_ be set for old configs.

If the user remembers to run defconfig. If he doesn't, the error is quite vague.

> > I can have the makefile also generate a
> > hint for older barebox versions if the image filename isn't found:
> > - Do you think the additional complexity is warranted?
> 
>  Yes, that's worth it.

ACK. Will do.

>  Regards,
>  Arnout

[snip]

- Pieter
