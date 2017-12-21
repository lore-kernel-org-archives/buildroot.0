From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Dec 2017 23:19:24 +0100
Subject: [Buildroot] [PATCH 1/1] gstreamer1: bump packages to 1.12.4
In-Reply-To: <CAFSsvmqKcSqvT7p8M2XjUFFcEgHNPZg5vMx+7yM7pVvET4vd+A@mail.gmail.com>
References: <20171221202131.6039-1-Adamduskett@outlook.com>
 <87d137zttv.fsf@dell.be.48ers.dk>
 <CAFSsvmqKcSqvT7p8M2XjUFFcEgHNPZg5vMx+7yM7pVvET4vd+A@mail.gmail.com>
Message-ID: <20171221221924.GB4638@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2017-12-21 17:08 -0500, Adam Duskett spake thusly:
> On Thu, Dec 21, 2017 at 3:53 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:
> >
> >  > Also remove 0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch
> >  > in gst-plugins-bad as the code has been fixed upstream:
> >  > see commit id: 536cb125773f36ecc46815e72ffa7ae2bba783d7 for more details
> >
> >  > Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> >
> > Why are you sending this as a single mega patch? Please send per-package
> > patches like you did for 1.12.3.
> >
> These are all a simple trivial bump. I didn't see it as a big deal to
> send them as a single
> patch.  If you wish to have 10 patches, I can do that, but I don't
> really have the time to do
> so right now.  I apologize for wasting your time.

Yes, we prefer having a patch for each bump, so that if one of them is
causing trouble, we can safely revert it without impacting the rest.

The only reason we'd take all the bumps as a single patch is if they
were linked, e.g. API/ABI breakage for example, that needs all of them
to be updated atomically. If this is the case, then the commit log
should say so.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
