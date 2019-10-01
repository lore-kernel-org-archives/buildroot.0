From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 1 Oct 2019 12:31:42 +0200
Subject: [Buildroot] [PATCH v2 1/1] cmake: bump version to 3.15.3
In-Reply-To: <0926d9c9-b986-330d-5617-9d7805ed09b9@mind.be>
References: <20190929115731.128904-1-james.hilliard1@gmail.com>
 <20190930233542.6a084b17@windsurf.home>
 <0926d9c9-b986-330d-5617-9d7805ed09b9@mind.be>
Message-ID: <14226_1569925915_5D932B1B_14226_343_1_20191001103142.GC3109@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-10-01 10:43 +0200, Arnout Vandecappelle spake thusly:
> On 30/09/2019 23:35, Thomas Petazzoni wrote:
> > On Sun, 29 Sep 2019 05:57:31 -0600
> > James Hilliard <james.hilliard1@gmail.com> wrote:
[--SNIP--]
> > What is the reasoning for changing the minimal CMake version to 3.10 ?
[--SNIP--]
>  I think the only reasonable way to deal with such a situation is to just apply,
> and to revert after a day or so if the autobuilders go red. We've done this a
> couple of times in the past. A patch sitting in patchwork is never going to
> trigger people to take care of the issues, autobuilder failures are a lot more
> concrete.

Agreed.

>  That said, a cmake bump should be relatively safe. Remember that we're using
> the system's cmake on many autobuilders, and there are plenty of distros where
> system cmake is vastly more recent than 3.8.

Well, not really in fact. See 5b57ae7ad19 (Revert "package/cmake: bump
version to 3.10.0 and add license hash") which as the title explained,
reverted a bump to cmake 3.10, because said bump actually turned the
autobuilders red.

It is not only about building _with_ a cmake more recent than 3.8, but
also about building that cmake to begin with, when the system-provided
cmake does not fit the bill.

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
