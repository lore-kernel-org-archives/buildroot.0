From: yann.morin at orange.com <yann.morin@orange.com>
Date: Wed, 15 May 2019 16:10:11 +0200
Subject: [Buildroot] [PATCH 1/1] linux: xenomai: use URL for the
 ADEOS/IPIPE patch
In-Reply-To: <20190515160029.1e85d845@windsurf>
References: <20190515090251.20668-1-sebastien.szymanski@armadeus.com>
 <20190515160029.1e85d845@windsurf>
Message-ID: <1091_1557929413_5CDC1DC5_1091_391_1_20190515141011.GA12386@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-05-15 16:00 +0200, Thomas Petazzoni spake thusly:
> On Wed, 15 May 2019 11:02:51 +0200
> S?bastien Szymanski <sebastien.szymanski@armadeus.com> wrote:
[--SNIP--]
> > +ifneq ($(XENOMAI_ADEOS_PATCH_URL),)
> > +XENOMAI_ADEOS_PATCH = $(shell basename $(XENOMAI_ADEOS_PATCH_URL))
> You can use $(basename ...) instead of $(shell basename ...)

I think you meant $(notdir ...)

$(basename ...) does not seem to do what you seem to think it would do.

Regards,
Yann E. MORIN.

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
