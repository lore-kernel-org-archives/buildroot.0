From: Charles Krinke <charles.krinke@gmail.com>
Date: Tue, 17 Jul 2012 06:44:49 -0700
Subject: [Buildroot] Qt on AM3517EVM
In-Reply-To: <20120717093212.0c7d5415@skate>
References: <CALo-6+hhvCkfT_4Rz4POqw5j_BPPLKHZ0saqEyeiKsp-tSJLdA@mail.gmail.com>
 <20120717093212.0c7d5415@skate>
Message-ID: <CALo-6+hsekD6L5pZhmsZD_4mW0CQTLbearUxdr-F_HitXq5W9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas:

Could you give us (me) a few pointers on the pre-requisite packages
and the path to move along to get Qt5 put together for buildroot?
Maybe with your guidance one of us can get at least partway down that
path.

Charles

On 7/17/12, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Le Mon, 16 Jul 2012 10:40:23 -0700,
> Charles Krinke <charles.krinke@gmail.com> a ?crit :
>
>> First of all, +100 for Thomas, Arnout and Julian. This morning, I was
>> able to load the jffs2 compiled file system from buildroot and run
>> "ts_calibrate" and got a functioning touch screen and color LCD with
>> Qt on the LogicPD AM3517EVM after *removing* the environment variable
>> QMAKESPEC which the TI-SDK insisted on adding to my .bashrc.
>
> Great.
>
>> Of course, no sooner had I gotten it to work then my customer says
>> "Thats cool, how about Qt5?"
>>
>> So, ... are we considering either a Qt5 bump or either Qt4/Qt5 with an
>> xconfig option?
>
> I think Qt5 needs a separate package from qt4, because many, many
> things have changed in Qt5. Also Qt5 apparently requires an OpenGL
> renderer, which wasn't the case in Qt4, so we will probably be keeping
> Qt4 around for quite a while for low-end platforms.
>
> Anyone willing to work on packaging Qt5 is definitely more than welcome
> to contribute such effort.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>


-- 
Charles Krinke
