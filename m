From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 16 Feb 2018 10:16:44 -0600
Subject: [Buildroot] [PATCH 2/2] modem-manager: Update to version 1.7.990
In-Reply-To: <CAM=7fbcpxVcPEJzJy7NmHYJvysm0GsMXS+=3VOJxBSFQU5VHbA@mail.gmail.com>
References: <1518727506-15403-1-git-send-email-jared.bents@rockwellcollins.com>
 <1518727506-15403-2-git-send-email-jared.bents@rockwellcollins.com>
 <20180216051811.32vyf5bm7ntohb5p@tarshish>
 <CAM=7fbcpxVcPEJzJy7NmHYJvysm0GsMXS+=3VOJxBSFQU5VHbA@mail.gmail.com>
Message-ID: <CANQCQpbCR7xaLpKF2fm7x7BCLBnFJ-MrRgEwrjmuJepBv9eagA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jared,

On Fri, Feb 16, 2018 at 10:08 AM, Jared Bents
<jared.bents@rockwellcollins.com> wrote:
>
[snip]
> I believe this is the first release that allows building and using
> without udev.  I recently came across a use case that needs modem
> manager but is running SE Linux that does not allow udev.

SE Linux does work with udev but it's usually preferred to not use it.

Matt
