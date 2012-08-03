From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 03 Aug 2012 11:04:22 +0200
Subject: [Buildroot] A little summer game ? :-)
In-Reply-To: <20120803103052.5ec63fb7@skate>
References: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
 <20120803103052.5ec63fb7@skate>
Message-ID: <501B9416.3090700@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Le Thu,  2 Aug 2012 22:53:47 -0400,
> Danomi Manchego <danomimanchego123@gmail.com> a ?crit :
>
>> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>
> Thanks for all the license information patches.
>
> However, those patches are too easy, so let's make a little summer
> game :-)
>
> I will merge 3 "license information" patches from someone for each
> patch that this developer sends to fix a build issue reported by the
> autobuilders. This way, I'm pretty sure we'll manage to reduce the
> number of build issues! This offer is obviously valid for all
> contributors.
>
> Ready to play the game ? :-)
>
> Thomas

Wheee, what a fun, Thomas! Call it "Buildroot Summer Of Bugfix" and
people will flock in! :-D

Seriously, I admit I'm not investing a lot of time in fixing build
errors. This is in part due to the limited time available, but
another important blocking factor is that many build errors happen
with external, custom toolchains that are installed on your build
server.

I almost daily skim through the build failures and take a look at
those about by packages and/or architectures I use and somehow know.
These are already a small subset of all the possibilities.
But often I discover these happen with toolchains (and probably
architectures) I don't have an easy access to, so I just go along.

It would help if the external toolchains used for the builds were
always available within Buildroot, so we could just apply the
[def]config, run make, have an icy drink while it downloads and
fails building and then, happily refreshed, hunt for the bug.

I'm not saying this would be easy to do, but it would be helpful
to me.

Luca
