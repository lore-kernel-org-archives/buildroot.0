From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Apr 2014 16:13:39 +0200
Subject: [Buildroot] [[RFC]] toolchain: print actual version of kernel
 headers when checking
In-Reply-To: <20140406142850.74de09ef@skate>
References: <1396184370-4204-1-git-send-email-yann.morin.1998@free.fr>
 <20140406142850.74de09ef@skate>
Message-ID: <20140406141339.GC3136@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-04-06 14:28 +0200, Thomas Petazzoni spake thusly:
> On Sun, 30 Mar 2014 14:59:30 +0200, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Reported-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  support/scripts/check-kernel-headers.sh | 39 ++++++++++++++++++++++++++++-----
> >  toolchain/helpers.mk                    |  3 +--
> >  2 files changed, 35 insertions(+), 7 deletions(-)
> 
> I've applied the patch with the following changes:
[--SNIP--]
> Also, I'm not entirely sure about the usage of $(uuidgen). Should we use
> mktemp instead?

Oh, probably, yes. I initially tossed that patch after Maxime enticed me
into it, so I just throw at it whatever was needed to make it work, and
then tried to clean it up.

The uuidgen part I missed when cleaning the patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
