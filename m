From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 07:43:37 -0500
Subject: [Buildroot] [PATCH v2 1/2] at: change upstream site,
 bump version
In-Reply-To: <20180918213949.36376-2-giulio.benetti@micronovasrl.com>
References: <20180918095726.50623f29@windsurf>
 <20180918213949.36376-1-giulio.benetti@micronovasrl.com>
 <20180918213949.36376-2-giulio.benetti@micronovasrl.com>
Message-ID: <CANQCQpa8CyJcUobU20r7jrptqr=mZEXAA6U=ud3VAJYV_ni5yA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio,


On Tue, Sep 18, 2018 at 4:40 PM Giulio Benetti
<giulio.benetti@micronovasrl.com> wrote:
>
> At is now available on a git repository at:
> https://salsa.debian.org/debian/at
> Main changes 3.1.16 -> 3.1.23:
> - add support for SELinux, multiple files
> - improve atd.service, see bug report 892819
> - fix various bugs and warnings
> - finalized script to release software

Please update the Config.in to list a valid url for this package.

Maybe https://salsa.debian.org/debian/at  or https://tracker.debian.org/pkg/at ?

Matt
