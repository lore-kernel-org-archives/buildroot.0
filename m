From: Richard Braun <rbraun@sceen.net>
Date: Wed, 12 Dec 2012 11:14:07 +0100
Subject: [Buildroot] [PATCH] linux: add option to get sources from
 custom directory
In-Reply-To: <20121212105418.601702fc@skate>
References: <1354873604-4304-1-git-send-email-rbraun@sceen.net>
 <20121212105418.601702fc@skate>
Message-ID: <20121212101407.GA9848@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 12, 2012 at 10:54:18AM +0100, Thomas Petazzoni wrote:
> On the other side, Linux, and bootloaders, are kind of special packages
> in that very often people will have to work on them, and making this
> easier might be useful.

The fact that the kernel is clearly separate from the other packages in
menuconfig, and that it already provides several ways of fetching the
source makes it hard for most people to think of the override mechanism.
On the other hand, the fact that it's handled almost like any other
package makes this hack extremely easy and safe to implement. I don't
see a reason not to provide this fetching method if the others aren't
also reconsidered (otherwise I wouldn't have bothered sending it
anyway).

-- 
Richard Braun
