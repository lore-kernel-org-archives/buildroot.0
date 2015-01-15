From: Santhosh Ramani <srcoolz@gmail.com>
Date: Thu, 15 Jan 2015 14:01:14 -0600
Subject: [Buildroot] Fwd: Qt4 Application - Touch detection
In-Reply-To: <20150115200634.598a27a3@tux.kirchner>
References: <CADKZYYLgvvnaur+Rc0J0UVshsQesEWZ2Feenb3WHA0gQztaKKA@mail.gmail.com>
 <20150115181324.48fc51e9@tux.kirchner>
 <CADKZYYKDoizsdEo28Ynwb=ndhJXmHW3Zoqx=aSpP-1BMnDYujw@mail.gmail.com>
 <CADKZYYK12mXBKQq=R2k7aAky-2i1FcfAyyaXqLdsnd5cpoQdXg@mail.gmail.com>
 <20150115200634.598a27a3@tux.kirchner>
Message-ID: <CADKZYYL-uKCvyEU9w7eAWi-yZv4bky5dTEz+RpUNAJQchjw2-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bjorn,

Thanks once again for your reply.

Does the capital 'T' in "Tslib" make any difference? I've only seen
> it written as 't', yet. Do you reboot between calibration and starting
> of your program? In my case the devices changed occasionally between
> reboots, so /dev/input/event0 was not always the correct device.


I tried with both options, but the results are the same. In my case, it's
always /dev/input/event0 so I think I'm okay here.

I'm not quite sure here. If you start a script which exports environment
> variables, I think those exportes variables only exist in this script
> and in its child processes. So, if you start ts_calibrate with a start
> script and after that your program from a differnt script or directly
> from your login shell, I suppose those variables aren't set anymore.
> Please try to export them either in a start script for your application
> or, as a quick test, in the shell you use to start your program. Just
> to make sure...


I tried exporting the variables from command line along with the scripts
and also the method you suggested, but there was no change in operation. I
was able to run the qt examples and once I exported the variables from
command line those examples worked fine.

I'm going to try to compile my Qt application with the library built by
buildroot and see if that helps. Do you have any other suggestions?

Thanks

- Santhosh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150115/f6b45c3d/attachment.html>
