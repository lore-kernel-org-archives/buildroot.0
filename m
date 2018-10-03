From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 2 Oct 2018 22:24:35 -0500
Subject: [Buildroot] [PATCH 1/1] aircrack-ng: bump to version 1.4
In-Reply-To: <20181002195301.19546-1-laurent.cans@gmail.com>
References: <20181002195301.19546-1-laurent.cans@gmail.com>
Message-ID: <CANQCQpbxOs7mVDAj6cDzvn+3e2gcdWeaKZ7t_vx4fSqTHrx2yQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Laurent,

On Tue, Oct 2, 2018 at 2:54 PM Laurent Cans <laurent.cans@gmail.com> wrote:
>
> - Remove patch (already in version)

I'm confirmed the dropped patch changes are in 1.4

[snip]

> -AIRCRACK_NG_VERSION = 1.3
> +AIRCRACK_NG_VERSION = 1.4

I've ran a few test-pkg builds with the updates and looks good enough
to merge and let the autobuilders see what they find.

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
