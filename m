From: Nicolas Dechesne <ndec13@gmail.com>
Date: Wed, 26 Jun 2013 00:51:30 +0200
Subject: [Buildroot] [RFC v2 1/1] ti-gfx: add new package
In-Reply-To: <51CA0EE2.70301@mind.be>
References: <1372177754-13431-1-git-send-email-spenser@gillilanding.com>
 <51CA0EE2.70301@mind.be>
Message-ID: <CAOT3mi+3ErtCqZejtcLHLHtQx=RB2ewa4BWBTL5Q=vS8iKUDUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 25, 2013 at 11:42 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 25/06/13 18:29, Spenser Gilliland wrote:
>>
>> This is WIP of adding the TI Graphics SDK to Buildroot
>
>
>  It's not really _the_ graphics SDK, since it only supports a subset of TI
> platforms (no OMAP1, OMAP2 or Davinci, and I'm not sure about OMAP5 either).

well, historically, in the Pandaboard days (OMAP4/OMAP5), a different
graphics SDK was being used. While it was based on the same delivery
from the GPU vendor (IMG), the entire GFX stack was heavily
improved/modified to work with the omapdrm driver and dmabuf. I don't
think what you call 'the TI graphics SDK' was ever used on Pandaboard.
That said, i am no longer involved with that, and things might have
changed or might change, so you need to understand from TI what is
their commitment (if any) to support OMAP4 in this GFX SDK moving
forward, especially given that the PandaBoard community seems to be
(slowly but surely) disappearing... I expect things might get better
for OMAP5, but the problem here might be the lack of board to test ;-)
