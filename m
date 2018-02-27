From: Martin Bark <martin@barkynet.com>
Date: Tue, 27 Feb 2018 15:07:43 +0000
Subject: [Buildroot] LADSPA on Buildroot
In-Reply-To: <CAPzckP6rEshBt-zHN+rfUd7eVS07Xp=KS3xJpVKLC4LnkuGu8g@mail.gmail.com>
References: <CAPzckP6rEshBt-zHN+rfUd7eVS07Xp=KS3xJpVKLC4LnkuGu8g@mail.gmail.com>
Message-ID: <CAFGQKxdJkP0feX-dxhXDa3RQHxtN7G7V_V4x-5Nd=kUq4fSzTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Can you make sure you include the buildroot mailing list for buildroot questions

On 26 February 2018 at 18:38, Sjoerd Venema <srg.venema@gmail.com> wrote:
> Hi Martin,
>
> I see that you have tried to install LADSPA on Buildroot?
> Did you ever succeed at that?

It was a while back now but from memory I experimented with LADSPA
using it to add a high pass filter to the audio device.  I submitted
some patches but in then end we decided not to include them in
buildroot due to the lack of development in the project (no activity
since 2007).

>
> I ask, because I'm trying the same thing, but don't know much about
> cross-compiling..

You can find my old patches here:

http://lists.busybox.net/pipermail/buildroot/2014-April/095073.html
http://lists.busybox.net/pipermail/buildroot/2014-April/095075.html
http://lists.busybox.net/pipermail/buildroot/2014-April/095074.html

They add the ladspa-sdk, caps and alsaequal packages to buildroot so
they will get cross compiled for your target.  You could try
resurrecting them for your needs.

Thanks

Martin

>
> Love to hear.
>
> rgds,
> Sjoerd
