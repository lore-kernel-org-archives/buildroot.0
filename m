From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Dec 2015 14:00:54 +0100
Subject: [Buildroot] RFC: Patch series for Kodi 16-Jarvis
In-Reply-To: <20151220135412.652a8344@free-electrons.com>
References: <3sigkcxlsq.ln2@ID-313208.user.individual.net>
 <vjiikcxh6u.ln2@ID-313208.user.individual.net>
 <20151220135412.652a8344@free-electrons.com>
Message-ID: <20151220130054.GC3677@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Bernd, All,

On 2015-12-20 13:54 +0100, Thomas Petazzoni spake thusly:
> On Sun, 20 Dec 2015 13:13:19 +0100, Bernd Kuhls wrote:
> > after a first review by Thomas I just updated the branch.
> 
> Thanks. I don't know if others will agree, but I believe it might make
> things easier to review if all the very simple "bump version" patches
> for all kodi add-ons were merged into a single patch. I know we
> normally don't do that, but it would make the series a lot shorter, and
> would emphasize the few updates for which it's not just a mechanical
> bump. So, this "big" commit would only contain the version bumps for
> the packages that don't require anything but a change to the version.
> If you need to do more than that, then it should be in a separate
> commit per package.

Well, I'm not too fond of that. But indeed, it's a pain to review either
way.

Maybe a middle-ground solution would be to bump all the screensavers in
one patch, all the audiocoders in a second one and so on?

Also, I'm not too fond of doing reviews on a github repository. I'd
largely prefer we have a complete RFC series on the list, otherwise the
reviews are lost. For example, I now can't see what Thomas as said,
since the branch has been rebased and previous comments are lost.

So, if the bumps are grouped by catregories, the series will
machanically be shorter, and will be easier to handle on the list.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
