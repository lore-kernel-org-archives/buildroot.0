From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 10 Mar 2017 12:17:14 +0100
Subject: [Buildroot] Qt5.8 display screen rotation
In-Reply-To: <CAD6G_RQS20T_YBu_5pkeH1vhey10WE63yEGu8sp70dbyP_VUYA@mail.gmail.com>
References: <CAD6G_RQS20T_YBu_5pkeH1vhey10WE63yEGu8sp70dbyP_VUYA@mail.gmail.com>
Message-ID: <CAAMH-yvvhnYxYm17w0vgkav==PGS3b9Z=NdqeyLEFKDMSdNwbA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jagan,

On Fri, Mar 10, 2017 at 11:00 AM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
> Hi,
>
> I'm looking for display screen to move it Portrait(vertical), based on
> the info from this thread [1] with qws we can make it, doe buildroot
> have support for that is yes can you point me the config and related
> info

qws doesn't exist in Qt5 any more. However rotation support has been
added back in Qt5.8:
http://doc.qt.io/qt-5/embedded-linux.html#eglfs

You need to set QT_QPA_EGLFS_ROTATION to 90/180/270.

Regards,
Gary
