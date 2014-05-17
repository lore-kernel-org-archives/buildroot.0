From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 May 2014 17:40:17 +0200
Subject: [Buildroot] [PATCH v7 17/31] xbmc-pvr-addons: Version bump to
 xbmc Gotham-compatible addon
In-Reply-To: <cmak4bxjmf.ln2@ID-313208.user.individual.net>
References: <1400326806-16428-1-git-send-email-bernd.kuhls@t-online.de>
 <1400326806-16428-18-git-send-email-bernd.kuhls@t-online.de>
 <20140517161342.5e745481@free-electrons.com>
 <cmak4bxjmf.ln2@ID-313208.user.individual.net>
Message-ID: <20140517154017.GA3459@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-17 17:09 +0200, Bernd Kuhls spake thusly:
> Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote
> in news:20140517161342.5e745481 at free-electrons.com: 
[--SNIP--]
> >> -# This cset is on the branch 'frodo'
> >> -# When XBMC is updated, then this should be updated to the
> >> corresponding branch 
> > 
> > I think this comment was quite useful. Could we keep it, after updating
> > it?
> 
> This patch does, what the comment was all about: Update xbmc-pvr-addons "to 
> the corresponding branch" "[w]hen XBMC is updated", so I think the comment 
> served its purpose ;)

Yep, indeed. However, I think we should keep a comment tht states
basically something similar, but for Gotham:
    # This cset in on master. When a Gotham branch is made, we should
    # follow it, as incompatible changes in the plugins API can happen
    # on the master branch.

That is, when XBMC makes such incompatible API changes on their master,
so do the plugins (at least, that's what hapenned between Frodo and
Gotham, hence the comment to stay on the Frodo branch.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
