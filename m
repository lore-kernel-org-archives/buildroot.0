From: yann.morin at orange.com <yann.morin@orange.com>
Date: Wed, 30 Jan 2019 07:00:51 +0100
Subject: [Buildroot] [PATCH] package/busybox: drop empty configure
 command
In-Reply-To: <877een8og6.fsf@dell.be.48ers.dk>
References: <31287_1548765380_5C5048C4_31287_396_1_f8e0aabc-6c1f-4878-b75e-c8bbc4e1a17e@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
 <877een8og6.fsf@dell.be.48ers.dk>
Message-ID: <21912_1548828053_5C513D95_21912_326_1_20190130060051.GA3548@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-01-29 16:37 +0100, Peter Korsgaard spake thusly:
> >>>>>   <yann.morin@orange.com> writes:
> 
>  > Since commit 50dc350c65 (package/busybox: update to 1.29.0), we no
>  > longer define the BUSYBOX_NOCLOBBER_INSTALL macro, so it expands to an
>  > empty string, so we end up with no action in BUSYBOX_CONFIGURE_CMDS.
> 
>  > Drop BUSYBOX_CONFIGURE_CMDS now that it serves no purpose.
> 
>  > Signed-off-by: Yann MORIN <yann.morin@orange.com>
> 
> FYI, your author name was not configured correctly (was your email
> address):

Yeah, I have no idea why that is, because here, my 'From' was really what
you'd expect:

    From: "Yann E. MORIN" <yann.morin@orange.com>

But it seems my intelligent mail server stripped it out... Let's see how
that one will fare...

> remote:
> remote: Refusing to update refs/heads/master:
> remote:     fc9fd5a8780966970525b4da8313091a0f0bbc80..8cbcb445b951b3b9e19d7cde7253ec6ce61f06f6
> remote:
> remote: Author name is not set properly (needs to be first and last name, and it is 'yann.morin at orange.com' instead)
> 
> I've fixed that and committed, thanks.

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
