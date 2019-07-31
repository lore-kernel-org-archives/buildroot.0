From: yann.morin at orange.com <yann.morin@orange.com>
Date: Wed, 31 Jul 2019 07:16:18 +0200
Subject: [Buildroot] [PATCH] package/qt5: change upstream location
In-Reply-To: <87o91b5xes.fsf@dell.be.48ers.dk>
References: <22558_1564482970_5D401D9A_22558_273_1_a7cd5c93-0be9-438c-b5b5-7c5a2dc7a274@OPEXCNORM3C.corporate.adroot.infra.ftgroup>
 <87o91b5xes.fsf@dell.be.48ers.dk>
Message-ID: <28252_1564550180_5D412424_28252_18_1_20190731051618.GA2498@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-07-30 17:56 +0200, Peter Korsgaard spake thusly:
> >>>>>   <yann.morin@orange.com> writes:
> 
>  > From: "Yann E. MORIN" <yann.morin@orange.com>
>  > Upstream pushes their delivery archives in to places:
>  >     https://download.qt.io/official_releases/
>  >     https://download.qt.io/archive/
> 
>  > After a while, only the latter remains, whith the former being pruned
>  > actively to contain only officially supported versions.
> 
>  > Switch to using the archive location, as it has everything, even the
>  > latest versions.
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Committed, thanks.

Thanks. :-)

> I take it this is also for 2019.02.x?

Yes, this is valid for 2019.02.x amd 2019.05.x.

Regards,
Yann E. MORIN.

> -- 
> Bye, Peter Korsgaard

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
