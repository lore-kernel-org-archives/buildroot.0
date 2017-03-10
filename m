From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Fri, 10 Mar 2017 17:00:57 +0530
Subject: [Buildroot] Qt5.8 display screen rotation
In-Reply-To: <CAAMH-yvvhnYxYm17w0vgkav==PGS3b9Z=NdqeyLEFKDMSdNwbA@mail.gmail.com>
References: <CAD6G_RQS20T_YBu_5pkeH1vhey10WE63yEGu8sp70dbyP_VUYA@mail.gmail.com>
 <CAAMH-yvvhnYxYm17w0vgkav==PGS3b9Z=NdqeyLEFKDMSdNwbA@mail.gmail.com>
Message-ID: <CAD6G_RQDRiKQw2GXHrqnvdE1a-vN97Pp38mQdvEXofo+E+nEkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Fri, Mar 10, 2017 at 4:47 PM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
> Hi Jagan,
>
> On Fri, Mar 10, 2017 at 11:00 AM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
>> Hi,
>>
>> I'm looking for display screen to move it Portrait(vertical), based on
>> the info from this thread [1] with qws we can make it, doe buildroot
>> have support for that is yes can you point me the config and related
>> info
>
> qws doesn't exist in Qt5 any more. However rotation support has been
> added back in Qt5.8:
> http://doc.qt.io/qt-5/embedded-linux.html#eglfs
>
> You need to set QT_QPA_EGLFS_ROTATION to 90/180/270.

I think this would require extra back-end support, couldn't see screen
rotation after set.

# export
export PWD='/root'
export QT_QPA_EGLFS_ROTATION='90'

-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
