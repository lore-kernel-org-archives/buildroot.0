From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Dec 2014 22:57:47 +0100
Subject: [Buildroot] [PATCH v5 1/4] Rename the variable "QUIET" to
 "BR_QUIET" for conformance
In-Reply-To: <CAHkwnC9=VJYF+1+Soz3AETg-B7ZPw-6_08mjG99XOsyQs=WP8A@mail.gmail.com>
References: <1419324901-14003-1-git-send-email-fabio.porcedda@gmail.com>
 <1419324901-14003-2-git-send-email-fabio.porcedda@gmail.com>
 <20141223111726.617588fd@free-electrons.com>
 <CAHkwnC8_FvgQuk3ngdcdy-dgG9iEo6A5xthyoQcM16CMMMonXw@mail.gmail.com>
 <CAHkwnC9=VJYF+1+Soz3AETg-B7ZPw-6_08mjG99XOsyQs=WP8A@mail.gmail.com>
Message-ID: <20141228215747.GA5434@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2014-12-28 17:24 +0100, Fabio Porcedda spake thusly:
> On Tue, Dec 23, 2014 at 11:51 AM, Fabio Porcedda
> <fabio.porcedda@gmail.com> wrote:
> > On Tue, Dec 23, 2014 at 11:17 AM, Thomas Petazzoni
> > <thomas.petazzoni@free-electrons.com> wrote:
> >> Hello,
> >>
> >> On Tue, 23 Dec 2014 09:54:58 +0100, Fabio Porcedda wrote:
> >>> Rename the variable "QUIET" to "BR_QUIET" accordingly to the convention
> >>> that internal variables should be named BR_XXX.
> >>>
> >>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> >>
> >> Do we really want all internal variables to be named BR_* ? Like
> >> HOST_CONFIGURE_OPTS, TARGET_CONFIGURE_OPTS, TARGET_MAKE_ENV and al. ?
> >> I'm not sure we want to do this, do we?
> >
> > On Wed, Nov 26, 2014 at 10:35 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > <snip>
> >> Also, in retrospect, QUIET was not a really good name for this variable
> >> in the Makefile. It would have been better if it were named BR_QUIET.
> >> But that was introduced way before we decided on a variable naming
> >> convention... :-/
> >
> > So which naming conventions Yann was referring?
> 
> Hi Yann,
> Can you please explain further your opinion?

Oh, sorry, it seems I was not explicit enough in my mail...

What I said was "QUIET was not a really good name [...] that was
introduced way before we decided on a variable naming convention..."

I did not want to make it sound like we should rename it, sorry.

I agree with Thomas here: we should keep QUIET as-is.

Sorry, sorry for the confusion... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
