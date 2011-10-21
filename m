From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 21 Oct 2011 13:19:53 +0200
Subject: [Buildroot] [RFC] Gerrit for BR
In-Reply-To: <87ehy6942n.fsf@macbook.be.48ers.dk>
References: <4EA02C2A.6070405@visionsystems.de> <20111021085714.2e661569@skate>
 <87ehy6942n.fsf@macbook.be.48ers.dk>
Message-ID: <CAAXf6LXygisaoU+KJo8R5Qb1Z+2Y4cd+zoBBAxi_y=Bw+exUig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Oct 21, 2011 at 9:49 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
> Hi,
>
> ?>> What do you think about using Gerrit
> ?>> (http://code.google.com/p/gerrit/) for Buildroot? Many OSS projects
> ?>> seem to switch to this system.
>
> ?Thomas> How does it compare to patchwork (http://patchwork.ozlabs.org/)
> ?Thomas> ? ?Patchwork works in relation to a mailing-list, from which it
> ?Thomas> automatically picks up patches and related review comments, and
> ?Thomas> it allows maintainers to track which patches have been
> ?Thomas> applied/not applied.
>
> ?Thomas> How does Gerrit work in that respect?
>
> I don't have any hands on experience (but I am following the openocd
> list, so I see it used), and my initial feeling is that something like
> patchwork would fit better our current way of working.
>
> But that's just an initial feeling, let's discuss at ELC and/or here on
> the list.

Whatever system chosen, if any, should be capable of importing patches
from the mailing list.

The gerrit documentation does not seem to mention this feature. It
suggests that every developer creates a git repository and pushes to
the gerrit system.
Personally, I don't use git, nor would I like to be forced to. I'm
using Mercurial. Stable buildroot versions are imported into a
Mercurial repository. I make changes in that repository and prepare
patches from that, which I check on the latest buildroot snapshot.
These patches are sent to the mailing list.
I prefer being able to continue working in this way, also with a
review system in place.

~Thomas
