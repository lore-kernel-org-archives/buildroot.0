From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 17 Apr 2014 10:21:28 +0200
Subject: [Buildroot] [PATCH v4 1/4] Makefile: fix coding style
In-Reply-To: <20140416194215.7d3151fa@skate>
References: <1396864610-8426-1-git-send-email-fabio.porcedda@gmail.com>
 <1396864610-8426-2-git-send-email-fabio.porcedda@gmail.com>
 <20140416194215.7d3151fa@skate>
Message-ID: <CAHkwnC_PPDM9y7j7m1gEmVwD+XX95_GuWsX=2PZY4M+Vy9LNrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 16, 2014 at 7:42 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Mon,  7 Apr 2014 11:56:47 +0200, Fabio Porcedda wrote:
>> As stated in the buildroot user manual add just a single space before
>> and after a '=' sign.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

I don't understand how it was happened but i lost the Acked-by tag of Arnout.

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

>> ---
>>  Makefile | 184 +++++++++++++++++++++++++++++++--------------------------------
>>  1 file changed, 92 insertions(+), 92 deletions(-)
>
> To be honest, while I definitely value the change to harmonize the
> coding style, such a large patch touching almost every line of the main
> Makefile is a recipe for conflicts with many other patches. So I would
> personally prefer to not apply this patch, and do the coding style
> fixes progressively, as we make other changes to the main Makefile.

I understand you concerns, nevertheless i personally think it's a
useful patch to apply, but it's just my personal opinion.

Regards
-- 
Fabio Porcedda
