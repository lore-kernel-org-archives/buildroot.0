From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 13 Apr 2014 21:02:51 -0400
Subject: [Buildroot] Patchwork cleanup #8: triaging proposal
In-Reply-To: <CAAXf6LUKOuGpMV0uzR3gDM++pOu9Ldtb=6FfTGHqXjMdpvCfSA@mail.gmail.com>
References: <CAAXf6LUKOuGpMV0uzR3gDM++pOu9Ldtb=6FfTGHqXjMdpvCfSA@mail.gmail.com>
Message-ID: <CANxTyt64XrOYPar2V-D_uUEWYixHBGep5UNFbijQn+HdB-Pheg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sun, Apr 13, 2014 at 3:43 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> [1/3] ccache: change compilercheck to use compiler and toolchain info
> Danomi Manchego <danomimanchego123@gmail.com>
> http://patchwork.ozlabs.org/patch/287383
>
> [2/3] ccache: change default cache directory path to match config setting
> Danomi Manchego <danomimanchego123@gmail.com>
> http://patchwork.ozlabs.org/patch/287384
>
> [3/3] ccache: provide capability to do initial ccache setup
> Danomi Manchego <danomimanchego123@gmail.com>
> http://patchwork.ozlabs.org/patch/287385
>
> Proposal for the above 3: D more work needed. Looking at Arnout's
> comments on the first patch, this needs to be thought through, and a
> final solution is to be implemented. I really think we should improve
> ccache in buildroot, though, so I hope a proper solution can be found.

I believe that Arnout's comments are in regards to the first patch
only.  The second and third patches are actually independent of the
first patch, and each other.  So they can be accepted or rejected on
their own merits.

Regardless - I've taken the first patch as far as I can, and don't
really have the bandwidth to rework it again.  So ... TODO list it is.

Danomi -
