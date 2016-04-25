From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 25 Apr 2016 22:49:06 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-pillow: new package
In-Reply-To: <20160425223517.1d98abb3@free-electrons.com>
References: <1461597623-14629-1-git-send-email-angelo.compagnucci@gmail.com>
 <1461597623-14629-3-git-send-email-angelo.compagnucci@gmail.com>
 <20160425223517.1d98abb3@free-electrons.com>
Message-ID: <CA+TH9VnYX1BQyo+c_ux+Q_BC5DevBp_KL+_gc+ztP8VrVZSXcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni

2016-04-25 22:35 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Mon, 25 Apr 2016 17:20:23 +0200, Angelo Compagnucci wrote:
>> This patch adds python pillow, the friendly python fork.
>> The accompaining patch to disable platform guessing was submitted
>> upstream for inclusion.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
> Since you're sending it in a series after the openjpeg patch, should we
> assume that this version of the python-pillow package requires the new
> version of openjpeg?

Python-Pillow 3.2.0 depends on openjpeg 2.1. The dependency is
optional, but if activated brakes the build.

>
> You posted other patches for python-pillow in the past, but without an
> update for openjpeg, so I'd prefer to ask, so that we can see if
> python-pillow can be merged independently from the openjpeg update.

Yes, I sent several patches in the past struggling to be up to date
with the mainline version.
The patches were used by me, but I felt that they should be shared.
If you want, you can accept (finally!) the old patch (v5) that carries
a little bit less up to date pillow [1].


Sincerely, Angelo

[1] http://patchwork.ozlabs.org/patch/587224/

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
