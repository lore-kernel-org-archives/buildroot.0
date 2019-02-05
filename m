From: Matthew Weber <matthew.weber@collins.com>
Date: Tue, 5 Feb 2019 10:01:14 -0600
Subject: [Buildroot] [External] Re: [PATCH v7 3/8] package/pound: Fix
 build with OpenSSL 1.1.x
In-Reply-To: <87o97qpnvh.fsf@dell.be.48ers.dk>
References: <20190129093919.22060-1-patrick.havelange@essensium.com>
 <20190129093919.22060-3-patrick.havelange@essensium.com>
 <CANQCQpZqdy-GnH4WMOR3g98t0aZM4PScjb3qfTCQqZ5=Qe0MkQ@mail.gmail.com>
 <CAKKE0ZGLvU4BrbW=Lj+V4XN-3cbTo9epEJh2pXfjKnMZDqVO+Q@mail.gmail.com>
 <87o97qpnvh.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpajgmNQGA48fFZDOi+VEye=h__4RZLwuYyGs5GCoH9g3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Patrick,


On Tue, Feb 5, 2019 at 3:48 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Patrick" == Patrick Havelange <patrick.havelange@essensium.com> writes:
>
>  > On Tue, Feb 5, 2019 at 2:26 AM Matthew Weber <matthew.weber@collins.com> wrote:
>  >>
>  >> Patrick H,
>  >> On Tue, Jan 29, 2019 at 3:40 AM Patrick Havelange
>  >> <patrick.havelange@essensium.com> wrote:
>  >> >
>  >> > From: Bernd Kuhls <bernd.kuhls@t-online.de>
>  >> >
>  >> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>  >> > Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
>  >> >
>  >>
>  >> Does this resolve:
>  >> https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_613_61336369ebe69a57098edabdf94a47f776a0440f_build-2Dend.log&d=DwIBAg&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=EEzpCupyGzXHLl3ImLmvVWBQ16S_793WLqLW_s8vR1E&s=yvWci3IuoKXZcHFOIIBAqeJjMsu7QvQEmD2PUxEEnsU&e=
>  >> ?
>
>  > Looking at the patch and the error in that build log, it matches, so I
>  > would say yes. (I didn't retry locally without the patch applied).
>
> But the patch breaks builds against libressl:
>
> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.busybox.net_pipermail_buildroot_2019-2DJanuary_241827.html&d=DwIBAg&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=EEzpCupyGzXHLl3ImLmvVWBQ16S_793WLqLW_s8vR1E&s=X54rrmmcIXVnokugUCK29_d5VJ0vpPnEWsOgAGR-Jgs&e=
>
> Care to fix that and send an updated patch?

Yep, I picked this one up
