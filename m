From: Sundareson, Prabindh <prabu@ti.com>
Date: Wed, 26 Jun 2013 02:36:53 +0000
Subject: [Buildroot] [RFC v2 1/1] ti-gfx: add new package
In-Reply-To: <CAOT3mi+3ErtCqZejtcLHLHtQx=RB2ewa4BWBTL5Q=vS8iKUDUQ@mail.gmail.com>
References: <1372177754-13431-1-git-send-email-spenser@gillilanding.com>
 <51CA0EE2.70301@mind.be>
 <CAOT3mi+3ErtCqZejtcLHLHtQx=RB2ewa4BWBTL5Q=vS8iKUDUQ@mail.gmail.com>
Message-ID: <321768C95D21724485BCE784F1BE98473EB59B09@DBDE04.ent.ti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The SDK did support OMAP4 in 4_04_00_02. OMAP1/2 devices are too outdated to consider in the package.

Focus of this package is on the frame buffer based devices. Omapdrm/dmabuf and additional changes will be merged eventually.

regards,
Prabu


-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Nicolas Dechesne
Sent: Wednesday, June 26, 2013 4:22 AM
To: Arnout Vandecappelle
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] [RFC v2 1/1] ti-gfx: add new package

On Tue, Jun 25, 2013 at 11:42 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 25/06/13 18:29, Spenser Gilliland wrote:
>>
>> This is WIP of adding the TI Graphics SDK to Buildroot
>
>
>  It's not really _the_ graphics SDK, since it only supports a subset 
> of TI platforms (no OMAP1, OMAP2 or Davinci, and I'm not sure about OMAP5 either).

well, historically, in the Pandaboard days (OMAP4/OMAP5), a different graphics SDK was being used. While it was based on the same delivery from the GPU vendor (IMG), the entire GFX stack was heavily improved/modified to work with the omapdrm driver and dmabuf. I don't think what you call 'the TI graphics SDK' was ever used on Pandaboard.
That said, i am no longer involved with that, and things might have changed or might change, so you need to understand from TI what is their commitment (if any) to support OMAP4 in this GFX SDK moving forward, especially given that the PandaBoard community seems to be (slowly but surely) disappearing... I expect things might get better for OMAP5, but the problem here might be the lack of board to test ;-) _______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
