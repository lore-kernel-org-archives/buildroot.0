From: Richard Braun <rbraun@sceen.net>
Date: Tue, 16 Oct 2012 17:42:29 +0200
Subject: [Buildroot] [PATCH] pkg-infra: produce legal info for
 proprietary packages
In-Reply-To: <506AEF12.5080906@lucaceresoli.net>
References: <20120928121758.GA2362@mail.sceen.net>
 <1348834801-2672-1-git-send-email-rbraun@sceen.net>
 <20120928142314.4810033e@skate>
 <CAAXf6LUF1bOSTGyMtC2OEbQSOeDiMphktpxtSZHmLj4ms9c+yQ@mail.gmail.com>
 <20120928190526.79db5cde@skate>
 <CAAXf6LVi1SKx9ZTDuROYxkP=r62fr=SpMnNxYc-Q=_bz+7Snsg@mail.gmail.com>
 <5068558E.4070005@mind.be> <506AEF12.5080906@lucaceresoli.net>
Message-ID: <20121016154229.GA15417@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 02, 2012 at 03:41:38PM +0200, Luca Ceresoli wrote:
> intel-microcode is clearly not fitting any of the two categories: we want to
> describe its license, but we are not allowed to redistribute it freely, as
> the license text reported from Richard seems to signify.

Actually, there is a license text embedded in the microcode file. It
reads :

Redistribution. Redistribution and use in binary form, without modification, are
permitted provided that the following conditions are met:
       .Redistributions must reproduce the above copyright notice and the following
disclaimer in the documentation and/or other materials provided with the
distribution.
       .Neither the name of Intel Corporation nor the names of its suppliers may be used
to endorse or promote products derived from this software without specific prior
written permission.
       .No reverse engineering, decompilation, or disassembly of this software is
permitted.
       ."Binary form" includes any format commonly used for electronic conveyance
which is a reversible, bit-exact translation of binary representation to ASCII or
ISO text, for example, "uuencode."


The disclaimer is a common 'this software is distributed "as is"'
notice.


I'm not exactly sure what "redistribute it freely" means here, since I'm
much more used to free licenses, but it seems to me that redistribution
is actually allowed as buildroot isn't in any way violating any of these
conditions, as long as this text appears in the list of licenses, which
my patch takes care of.

Do you agree with that, and if yes, how would that change the rework
proposal ?

-- 
Richard Braun
