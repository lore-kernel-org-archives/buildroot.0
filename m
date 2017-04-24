From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 24 Apr 2017 11:36:40 -0400
Subject: [Buildroot] [PATCH 1/1] busybox: preserve ncurses progs/tools
In-Reply-To: <8b127902-0268-8307-70da-065362773da9@mind.be>
References: <1492140047-60102-1-git-send-email-matthew.weber@rockwellcollins.com>
 <4e5df153-6f58-8b65-faf4-f87fb91324cd@mind.be>
 <20170420092015.3b2f7fbd@free-electrons.com>
 <87pog3ypb1.fsf@dell.be.48ers.dk>
 <8b127902-0268-8307-70da-065362773da9@mind.be>
Message-ID: <CANxTyt40oC9PknEk-r7uBOmgjAEGJd4tgpQ-6uYKDksoFYVBxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sun, Apr 23, 2017 at 4:55 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> 2. Make sure that busybox doesn't overwrite a tool that already exists. Needs to
> be done for all the different ways that busybox can install things. Then the
> order doesn't matter. Great solution, except for the bloatification. Also, it is
> not great when you have FEATURE_INDIVIDUAL selected in busybox, because a
> busybox-rebuild will not actually rebuild anything.

Does https://git.buildroot.net/buildroot/commit/?id=802bff9c42376078f28aa49d3eab630120940eb0
not take care of overwriting tools that already exist?

Danomi -
