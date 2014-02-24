From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 24 Feb 2014 09:11:40 +0100
Subject: [Buildroot] [PATCH 0/7] Misc set of fixes
In-Reply-To: <1393196291-12636-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393196291-12636-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LUT9iL353aWjybhjJoQJmfD_iKGm842Au71137q1u9B1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 23, 2014 at 11:58 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> The first three patches are fixes for build failures. The last four
> patches are fixes for missing dependency propagation of BR2_USE_MMU.
>

It would be great if someone could create a script (for example based
on kconfiglib) that automatically verifies whether all needed
dependencies are in place. Since the logic to determine this is pretty
straightforward, it should not be th?t hard. It may take a while to
execute, but that shouldn't be a problem.

Any interested persons?

Samuel: you have been using kconfiglib before, what is your view on it?

Thanks,
Thomas
