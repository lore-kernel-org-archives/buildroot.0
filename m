From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Dec 2017 19:01:27 +0100
Subject: [Buildroot] Bug report or teaching moment -- downloading kernel
 patches
In-Reply-To: <CAF_dkJD0Qp_U5Efes44iiZegnG4+4++1DSQA7CvG9M_ekK84xA@mail.gmail.com>
References: <CAF_dkJCrv_M-bXkXGtoY0esM6GS_MW6+Pjeb9aJWUCRFstST8A@mail.gmail.com>
 <20171230171021.GG2921@scaer>
 <CAF_dkJD0Qp_U5Efes44iiZegnG4+4++1DSQA7CvG9M_ekK84xA@mail.gmail.com>
Message-ID: <20171230180127.GI2921@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patrick, All,

On 2017-12-30 12:55 -0500, Patrick Doyle spake thusly:
> On Sat, Dec 30, 2017 at 12:10 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2017-12-30 11:32 -0500, Patrick Doyle spake thusly:
> >> I can't figure this out...am I doing something wrong or have I uncovered a bug?
> >
> > Bug.
> Is there a workaround?  Or should I just wget the patch set into my dl
> directory (and put a big README reminding me & others to do the same)
> and hope that nobody forgets.

If the kernel is also available as a tarball, then use that instead of a
git clone.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
