From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 13 Nov 2011 21:43:09 +0100
Subject: [Buildroot] [PATCH 0 of 2 v2] gentargets: add scp and Mercurial
	download helpers
In-Reply-To: <patchbomb.1318602760@devws108>
References: <patchbomb.1318602760@devws108>
Message-ID: <CAAXf6LXGTJeSbqqpBUMqchv=CTq7zyTH36=vkZHvtWwP=c2Qaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Oct 14, 2011 at 4:32 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> This patch series adds download methods for scp and Mercurial.
>
> Documentation was updated in the first version of this series, but this update
> was left out in this series because of the move to asciidoc that is not yet
> complete. Once the new documentation format is in master, it needs to be
> updated with these new features.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
> v2: update scp patch based on comments.
>
> ?Config.in ? ? ? ? ? ? ? ? ? | ?17 ++++++++++++++++-
> ?package/Makefile.package.in | ?82 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------
> ?2 files changed, 91 insertions(+), 8 deletions(-)
>

I think we should include these two patches also in 2011.11.
I'll try to prepare a documentation update for this as well and send
out this week.

Best regards,
Thomas
