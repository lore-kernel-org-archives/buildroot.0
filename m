From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 21 Jun 2021 20:24:38 +0200
Subject: [Buildroot] Gstreamer1.18 build static option
In-Reply-To: <CALM_QrXzearvsRtm_QikCF1atAWiKsqBAFhGPUHYcbMQqkM3RA@mail.gmail.com>
References: <CALM_QrXzearvsRtm_QikCF1atAWiKsqBAFhGPUHYcbMQqkM3RA@mail.gmail.com>
Message-ID: <20210621202438.518c144c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ratheendran,

On Mon, 21 Jun 2021 13:05:45 +0530, Ratheendran R <ratheendran.s@gmail.com> wrote:

> Hi All,
>
>
> I am looking for the option to build gstreamer statically and linking with
> our webrtc plugin.

There are no per-package options in buildroot to select static or dynamic
linking...

>
>  looks like it is not supported on buildroot 2020.x, let me know if this
> working on any of the buildroot versions.please share the details or
> workaround if exists.

Only a global one, take a look at 'make menuconfig' and 'Build options' -->
'libraries' --> 'staic only'/'shared only'/'both static and shared'....

But not sure if gstreamer will honor your selection as you expect it (personally
do only use/test the shared case)...

Regards,
Peter


>
>
> thanks in advance
