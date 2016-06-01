From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 1 Jun 2016 23:53:54 +0200
Subject: [Buildroot] Patchwork cleanup, week #22
In-Reply-To: <20160601232654.07800a9b@free-electrons.com>
References: <20160601232654.07800a9b@free-electrons.com>
Message-ID: <20160601235354.1248a84e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, 1 Jun 2016 23:26:54 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

[...]
>  6/ Makefile: Fix overlay overwriting everything
>     http://patchwork.ozlabs.org/patch/581463/
> 
>     A problem with the merged /usr option, and when the rootfs overlay
>     contains specific directories. Discussion has happened, no decision.
> 
[...]

Was not aware of this patch (and the discussion) but the same change is
already committed with a slightly different reasoning ([1])...

Regards,
Peter

[1] https://git.busybox.net/buildroot/commit/Makefile?id=0db34529f48a0ca76a4aadd08c9af57d37366d18
