From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 22 Apr 2014 22:28:22 +0200
Subject: [Buildroot] [PATCH v4 1/4] Makefile: fix coding style
In-Reply-To: <535692CF.1040607@mind.be>
References: <1396864610-8426-1-git-send-email-fabio.porcedda@gmail.com>
 <1396864610-8426-2-git-send-email-fabio.porcedda@gmail.com>
 <20140416194215.7d3151fa@skate> <535692CF.1040607@mind.be>
Message-ID: <CAHkwnC_sbZkgCxB5SEs82GEyCMoJMoCS159epRLGyuheAEhVtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 22, 2014 at 6:03 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 16/04/14 19:42, Thomas Petazzoni wrote:
>> Dear Fabio Porcedda,
>>
>> On Mon,  7 Apr 2014 11:56:47 +0200, Fabio Porcedda wrote:
>>> As stated in the buildroot user manual add just a single space before
>>> and after a '=' sign.
>>>
>>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>>> ---
>>>  Makefile | 184 +++++++++++++++++++++++++++++++--------------------------------
>>>  1 file changed, 92 insertions(+), 92 deletions(-)
>>
>> To be honest, while I definitely value the change to harmonize the
>> coding style, such a large patch touching almost every line of the main
>> Makefile is a recipe for conflicts with many other patches. So I would
>> personally prefer to not apply this patch, and do the coding style
>> fixes progressively, as we make other changes to the main Makefile.
>
>  I disagree. The entire patch does a single change to a single file
> almost mechanically. It's true that there is a risk of conflicts, but
> splitting up the patch doesn't reduce that risk. It's easy enough to try
> to apply and ask for a refresh if there is a conflict.
>
>  Of course, currently it doesn't apply cleanly anymore because you
> delayed applying it, so I also can't re-Ack it. So Fabio, can you refresh?

Sure, i will do that tomorrow.

Regards and thanks.
-- 
Fabio Porcedda
