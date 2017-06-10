From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 10 Jun 2017 09:21:58 +0200
Subject: [Buildroot] [PATCH 2/2] package/nut: specify --with-user/group
	when building NUT
In-Reply-To: <B2B80EDF-A4B3-4D1A-AE33-F52EF46D829C@jens-maus.de>
References: <20170608153557.30726-1-mail@jens-maus.de>
 <20170608192014.GB3058@scaer>
 <B2B80EDF-A4B3-4D1A-AE33-F52EF46D829C@jens-maus.de>
Message-ID: <16112CE8-C83C-4F1A-A599-AFB3791F309A@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On June 10, 2017 9:04:47 AM GMT+02:00, Jens Maus <mail@jens-maus.de> wrote:
[snip]
> Thanks for your comments. Indeed I could remove ?with-user=nobody from
> my patchset. And of course it would be better to run NUT with a new
> user. But IMHO for the time being the patch I submitted should be
> sufficient and we can apply an additional patch later. Or is my patch
> rejected now and I need to rework it for being accepted?

Yes, please resubmit your patch that defines a nut user, and uses
that during configure.

Keep both --with-user and --with-group.

> Sorry for
> asking, but I am fairly new to submitting patches to buildroot and I am
> not fully confident to the procedure.

No problem. You did correct so far. :-)

> In addition, I cannot see my
> initial patch at patchwork anymore?!?!

Indeed, because it was marked "changes requested".

Regards,
Yann E. MORIN..

Jens, All,
-- 
Sent from my phone. Please excuse my brevity.
