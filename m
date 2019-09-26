From: yann.morin at orange.com <yann.morin@orange.com>
Date: Thu, 26 Sep 2019 10:58:25 +0200
Subject: [Buildroot] [PATCH v3] package/pkg-utils.mk: add dl_dir to
 show-info output
In-Reply-To: <20190926085536.3bfe0907@windsurf>
References: <20190803140433.27967-1-arnout@mind.be>
 <20190925220223.12bc3db7@windsurf> <20190925204103.GG7274@scaer>
 <3ef870e5-4b17-e4c3-aa17-1bb69c911e99@mind.be>
 <20190926085536.3bfe0907@windsurf>
Message-ID: <18509_1569488307_5D8C7DB3_18509_392_1_20190926085825.GB3355@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, Yann, All,

On 2019-09-26 08:55 +0200, Thomas Petazzoni spake thusly:
> On Wed, 25 Sep 2019 23:28:05 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> > > So, what's the point in keeping external-deps?  
> >  Kill it with fire!
> Do we really want to do that? Remember that we removed source-check,
> and Thomas DS wanted to reintroduce it because it was useful in his
> use-case ?
> 
> I'm all for dropping duplicated functionality to keep a sane code base
> and a clear user experience (when there's gazillions of ways to achieve
> the same thing, it's very confusing for users). But breaking stuff for
> existing users is not nice, and I know our BDFL is also not happy with
> breaking things.

So I would disagree with my out-of-work alter-ego, and I would consider
that external-deps is not broken: it has always explicitly just returned
the basename of the downloads and continues to do so. It is different
from what show-info provides.

Whether some people find it useful or not (I don't) is another subject.

Regards,
Yann E. MORIN.

PS. Yes, keeping this dichotomy is getting me a bit schizophrenic! ;-)
YEM.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
