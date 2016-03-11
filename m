From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Mar 2016 11:23:18 -0300
Subject: [Buildroot] [PATCH] mesa3d: add intel gallium driver support
In-Reply-To: <87oaalhzao.fsf@dell.be.48ers.dk>
References: <1457632891-4354-1-git-send-email-gustavo@zacarias.com.ar>
 <8760wum7dj.fsf@dell.be.48ers.dk> <56E1D44F.70807@zacarias.com.ar>
 <3979rcxl7o.ln2@ID-313208.user.individual.net>
 <871t7hjmol.fsf@dell.be.48ers.dk> <56E2A91A.1030509@zacarias.com.ar>
 <87wpp9i6se.fsf@dell.be.48ers.dk> <56E2B03B.9000701@zacarias.com.ar>
 <87oaalhzao.fsf@dell.be.48ers.dk>
Message-ID: <56E2D4D6.4090008@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/16 11:19, Peter Korsgaard wrote:

> Yes it does, it is just not clear to me that using this gallium driver
> is the way to do it. Your commit message also didn't explain this, which
> is why I'm asking.
>
> Is this gallium driver useful for non-wayland (X11) setups? If not,
> perhaps it should depend on wayland.

I fail to see why, you've got many other gallium drivers and they don't 
mention wayland either (noveau, r600, svga, swrast, virgl).
I'm pretty sure these are valid for qt5 as well since it can use an EGL 
backend too.
Regards.
