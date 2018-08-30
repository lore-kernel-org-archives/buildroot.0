From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 30 Aug 2018 07:48:43 -0500
Subject: [Buildroot] [PATCH v2 1/5] toolchain/toolchain-wrapper: add
 link wrapper
In-Reply-To: <20180830095349.1247fe54@windsurf>
References: <1535600085-31526-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1535600085-31526-2-git-send-email-matthew.weber@rockwellcollins.com>
 <20180830095349.1247fe54@windsurf>
Message-ID: <CANQCQpY-BCYRmU-RHqh0UqCqhW4fR9XqtLc=V6V-qu=dYqb8Ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
On Thu, Aug 30, 2018 at 2:54 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Matt,
>
> On Wed, 29 Aug 2018 22:34:41 -0500, Matt Weber wrote:
> >  - Updates symlink creation int/ext toolchain
> >  - Adds new source file for link wrapper with build/install
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> I think this commit log should contain a detailed explanation of why
> wrapping the linker is necessary. Could you provide an example of a
> package that absolutely needs the linker to be wrapped ? I'd like to do
> a bit of testing, because I'm still not entirely convinced that we want
> to wrap the linker. Perhaps we need to do this, but I'd like to spend a
> bit of time looking at a specific example of a package that makes this
> necessary. Could you provide such an example ?
>

Definitely. I can put together a few scenarios.

Right now the v2 series has an issue found by my night run of tests
and I'll have to respin.  I'll include something in the v3 series.

All, if anyone build tests this, the v2 change to preserve -fPIC has
broken busybox individual binaries mode.

Matt
