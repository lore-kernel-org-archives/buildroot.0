From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 16 May 2013 09:18:38 -0500
Subject: [Buildroot] [PATCH v6 09/10] libopenmax: Add libopenmax virtual
	package
In-Reply-To: <20130516095842.78066d20@skate>
References: <1368655178-19176-1-git-send-email-spenser@gillilanding.com>
 <1368655178-19176-10-git-send-email-spenser@gillilanding.com>
 <20130516095842.78066d20@skate>
Message-ID: <CAEBucnBvGuHMM3cgGcaSyJ3M_ShpNuUKEW+8TRz4TQTmpDsh9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> I'm starting to wonder if those virtual packages shouldn't be separated
> from each other, and named virtual-<something>, i.e:
>
>         package/virtual-opengl/
>         package/virtual-openvg/
>         package/virtual-egl/
>         package/virtual-openmax/
>
> but ok, that's certainly a different work. This current patch series is
> already long enough.

I agree that a change like you suggested would be better but it's
probably best left for another patch series due to the required
changes being quite large.

>> +ifeq ($(BR2_PACKAGE_BELLAGIO),y)
>> +LIBOPENMAX_DEPENDENCIES += bellagio
>> +endif
>
> Unless I missed something, there is no bellagio package in Buildroot
> for now, so this chunk should only be added once bellagio is added.

It's in package/multimedia/bellagio.


Thanks,
Spenser



--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
