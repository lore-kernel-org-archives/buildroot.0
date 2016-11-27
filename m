From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Nov 2016 23:25:40 +0100
Subject: [Buildroot] [PATCH v2] package/pseudo: update version
In-Reply-To: <20161127231918.6a07ab13@free-electrons.com>
References: <20161127011202.6938-1-gael.portay@savoirfairelinux.com>
 <20161127231918.6a07ab13@free-electrons.com>
Message-ID: <CACXmViY+YYU2WSWVL1AE809tVRUsO52rt95RZX+uAHYGc_BOmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 27, 2016 at 11:19 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Generally speaking, pseudo is now an "orphan" host package, which we
> generally don't like in Buildroot, since it means it is never tested.
> What should we do about it? Remove it until it gets used again in the
> future?
>
> I've added Arnout, Yann and Peter in Cc so we can have a discussion
> about this.

Unless we have any real reason to move to pseudo instead of fakeroot
in the (near) future, then I think we should simply get rid of the
package - But I wasn't sure, which is why I didn't revert the patches
adding the package for now.

Do we know of such reasons?

-- 
Bye, Peter Korsgaard
