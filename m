From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 12 Mar 2019 15:04:27 +0100
Subject: [Buildroot] [PATCH] docs/manual: add note about spurious errors
 duing make printvars
In-Reply-To: <b2ce6da8-e324-7ac5-d386-60c0ec8925f1@mind.be>
References: <20190312105713.23968-1-martin.kepplinger@ginzinger.com>
 <99874541-4ce3-4cb8-b7ce-a0d3d7496357@mind.be>
 <20718_1552396490_5C87B0CA_20718_131_1_20190312131447.GA25212@r-lnx-nyma7486-2>
 <b2ce6da8-e324-7ac5-d386-60c0ec8925f1@mind.be>
Message-ID: <11344_1552399469_5C87BC6D_11344_307_1_20190312140427.GB25212@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-03-12 14:53 +0100, Arnout Vandecappelle spake thusly:
> On 12/03/2019 14:14, yann.morin at orange.com wrote:
> > I'd like the ability to extract many unrelated variables, but not all of
> > them either, so maybe we can accept that VARS is a sapce-separated list
> > of patterns to extract, ?-la:
> >     make -s printvars VARS="VAR_1 VAR_2 PAT_1_% PAT_2_%"
>  This has worked ever since we introduced VARS...

Wooo... I did not even try it, I just assumed from the manual that this
was not supported, because we say "the make pattern" (i.e. singular)...

OK, so I know someone that will soon be sending an update to the
manual... ;-)
Thanks!

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
