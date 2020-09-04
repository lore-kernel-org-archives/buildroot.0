From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Sep 2020 15:56:21 +0200
Subject: [Buildroot] [PATCH 2/3] package/libcamera: Update requirements
 for C++17
In-Reply-To: <dac2b203-377a-44fb-85ab-4b9ed9cc7b34@ideasonboard.com>
References: <20200904095148.844292-1-kieran.bingham@ideasonboard.com>
 <20200904095148.844292-3-kieran.bingham@ideasonboard.com>
 <20200904145105.6cf2e0c1@windsurf.home>
 <dac2b203-377a-44fb-85ab-4b9ed9cc7b34@ideasonboard.com>
Message-ID: <20200904135621.GJ14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kieran, All,

On 2020-09-04 13:55 +0100, Kieran Bingham spake thusly:
> On 04/09/2020 13:51, Thomas Petazzoni wrote:
> > On Fri,  4 Sep 2020 10:51:46 +0100
> > Kieran Bingham <kieran.bingham@ideasonboard.com> wrote:
> > 
> >> The libcamera project has moved to C++17. Update the toolchain
> >> requirements accordingly.
> >>
> >> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > 
> > Is this fixing some specific autobuilder failure ? If so, do you have a
> > reference ?
> 
> No, that's a pre-requisite for patch 3/3.
> libcamera is now built with C++17 as a minimum requirement.

So the C++17 requirement comes with the version bump. In this case, it
should be a single patch: bump and add new requirements.

Otherwise, if we end up not applying, or reverting patch 3, then C++17
requirement is superfluous on its own.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
