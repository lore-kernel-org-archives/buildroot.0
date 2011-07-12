From: Daniel Mack <zonque@gmail.com>
Date: Tue, 12 Jul 2011 14:57:39 +0200
Subject: [Buildroot] [PATCH] alsa-utils: Add patch for amixer TLV output
In-Reply-To: <874o2smxco.fsf@macbook.be.48ers.dk>
References: <1310399020-27026-1-git-send-email-zonque@gmail.com>
 <874o2smxco.fsf@macbook.be.48ers.dk>
Message-ID: <CACTFLAO26z7eENPn41Mh0wtUtGB0qjyR8ogJEF7w7aR6Vw23Qw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 11, 2011 at 9:27 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:
>
> ?Daniel> This patch is queued upstream, so it can be dropped once a new version
> ?Daniel> of alsa-utils is released.
>
> Could you give a quick explanation about what the patch does for people
> not following alsa development?

It is about a specific ALSA control and the way it can be accessed
using the amixer command line tool. But it's not that important after
all, and as it will be fixed in the next release anyway, we can just
wait for it.


Thanks,
Daniel
