From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 16 Apr 2013 08:39:39 +0100
Subject: [Buildroot] [PATCH] libserial: new package
In-Reply-To: <20130416093540.5cbdade3@skate>
References: <1366096804-2032-1-git-send-email-spdawson@gmail.com>
 <20130416093540.5cbdade3@skate>
Message-ID: <CAHt8ZCNJzS1yTPzV-yRWniWRpg9koihqqXg5Z=6L0afF=g_GvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, thanks for looking at this.

On 16 April 2013 08:35, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> I think prdownloads.sourceforge.net is just one particular mirror of
> Sourceforge, and we now prefer to use http://downloads.sourceforge.net,
> which automatically redirects to one available mirror. See all existing
> BR packages whose upstream tarball is hosted on Github.

Okay; will fix this.

> Besides that, your patch is numbered 0000, while the other packages
> that we have typically have the patches numbered from 1.

Okay, understood. I've actually just realised that the patch is
unnecessary if we use upstream version 0.6.0rc1; so I'll remove the
patch altogether in the next iteration.

Simon.
