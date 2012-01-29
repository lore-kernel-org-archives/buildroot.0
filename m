From: inblueswithu <inblueswithu@hotmail.com>
Date: Sun, 29 Jan 2012 17:35:48 +0530
Subject: [Buildroot] Image created is not booting,
 waiting for infinite time
In-Reply-To: <20120129124434.3096460b@skate>
References: <BLU0-SMTP88C894F00679EB12CEC0A3D28F0@phx.gbl>
 <20120128124931.5dddc20e@skate>
 <BLU0-SMTP296551C52410B48DE52F60D28C0@phx.gbl>
 <20120129103634.620aced8@skate>
 <BLU0-SMTP3763BD6AB472CBE81E9839DD28C0@phx.gbl>
 <20120129124434.3096460b@skate>
Message-ID: <BLU0-SMTP1493F4E86136ABF17E33C3BD28C0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 29 January 2012 05:14 PM, Thomas Petazzoni wrote:
>
> Your conclusion is wrong: it is not because you have used the kernel
> headers 2.6.37.x that you *must* use 2.6.37 on your target.
Thankyou for that clarification.
> It might require some minor adaptation.
>
> But still, I don't understand your persistence in trying to use 2.6.37
> while the qemu_arm_versatile_defconfig is a known working
> configuration. Can you please try with that one without any
> modification.
I 've proceeded with few changes in the qemu_arm_versatile_defconfig but 
with out any
potential changes, it worked find. I 've got the Images and successfully 
booted them!
/This is my first successful Build!/ Thanks for all those who 
contributed to buildroot.

I still 've a lot to try, to learn the buildroot for full length 
customizing my OS.

I'll try with out any changes to the qemu_arm_versatile_defconfig and 
let you know if
it is successful.

Thanks & Regards
/inblueswithu/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120129/3690af7b/attachment.html>
