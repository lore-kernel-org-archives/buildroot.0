From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 6 May 2016 00:01:55 +0200
Subject: [Buildroot] [PATCH 00/13 v6] legal-info improvements and
 completeness (branch yem/legal-3)
In-Reply-To: <ef5ac802-80d2-e842-fb45-4a32aa0e3507@mind.be>
References: <cover.1461881416.git.yann.morin.1998@free.fr>
 <ef5ac802-80d2-e842-fb45-4a32aa0e3507@mind.be>
Message-ID: <20160505220155.GD4367@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-05-04 00:33 +0200, Arnout Vandecappelle spake thusly:
> On 04/29/16 00:27, Yann E. MORIN wrote:
> >Hello All!
> >
> >This series brings improvements to the legal-info infrastructure, so
> >that we provide the most complete and correct content in the output of
> >legal-info.
> >
> >TL;DR:
> >
> >Currently, our legal-info ouput is missing two types of files that might
> >be important to have included in the legal-info output:
> >  - patches
> >  - extra downloads
> >
> >
> >This series is split in 5 consecutive parts, each depending on the
> >previous ones:
> >
> >  - patches 1-4 make sure legal-info will work in off-line mode;
> >
> >  - patches 5-7 reorganise the legal-info directory structure to
> >    accomodate for the fact that more than one source archive/file may
> >    be saved for each package;
> >
> >  - patches 8-11 actually save the patches and extra downloads in the
> >    legal-info output;
> >
> >  - patch 12 adds a list of hashes for all files in the legal-info
> >    output;
> >
> >  - patch 15 (from Luca) explicits patches licensing.
> 
>  That's patch 13, actually :-)

Doh... Are you sure?  ;-)

/me looks at his keyboard. '3' and '5' are not side-by-side; there is
'4' in-between... Damn, so far for my kbd-dislexia... ;-)

>  For 2016.05, we certainly still want patch 13, and probably also patches 1,
> 2, 5, 6, 7, 8, 9, 11 (because they fix a real issue, that legal-info is
> incomplete). I do have some comments on these but it's nitpicking mostly.
> 
>  The other patches are more controversial.

As much as I can see that patch 4 (and 3) might be controversial, I fail
to see why patch 10 (bail-out when two patches are named the same) is
still controversial.

For that patch, I switched from renaming to bailing out after both
Thomas, Luca and you commented that was what you prefered.

I also stated that I had implemented both solutions, but posted the
renaming one so as to not break existing system. But surely, if I had
both solutions, it was for a reason: I also prefer bailing out. ;-)

So, I fail to see the controversy on that patch. ;-)

As for 12, Thomas and Luca already acked it...

>  If you would repost, do you think you could take that order?

I doubt it...

I can try, but if I face a rebase hell, I'll bail out...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
