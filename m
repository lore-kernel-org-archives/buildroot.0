From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 17:27:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/cairo: fix CVE-2018-19876
In-Reply-To: <87a750ysuq.fsf@tarshish>
References: <20200229200016.3448256-1-fontaine.fabrice@gmail.com>
 <20200301154235.GL8743@scaer> <87a750ysuq.fsf@tarshish>
Message-ID: <20200301162731.GQ8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2020-03-01 17:53 +0200, Baruch Siach spake thusly:
> On Sun, Mar 01 2020, Yann E. MORIN wrote:
> > On 2020-02-29 21:00 +0100, Fabrice Fontaine spake thusly:
> >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > As per Peter's review, this is a long shot for a security fix: better
> > backport the two patches (+autoreconf) for master. The version bump can
> > then be respun for next or after the merge.
> > I've marked this as chages-requested in patchwork.
> Are you sure? This patch is now master commit 91b150dc33841be1.

OK, I got super confussed, then:

  - https://patchwork.ozlabs.org/patch/1247071/ wsa the security bump,
    and the one I reviewed (and came to the same conclusion as Peter),
    and which I marked as changes-requested;

  - https://patchwork.ozlabs.org/patch/1247133/ is the one Peter
    applied, and the mail I replied to with the conclusion of the bump,
    above.

So, after shaking my head to put everything back in their places, I
marked 1247071 as enw again, while 1247133 was already marked accepted.

Damn... Thanks for noticing.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
