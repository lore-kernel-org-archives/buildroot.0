From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 11:05:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/bird: add a unprivileged user
In-Reply-To: <CAFtSRGCunAxWP2VizuD_yY8zzqnOqksuzKz-F=PiFHv+JdOb7A@mail.gmail.com>
References: <20190205105630.17008-1-adrien@gallouet.fr>
 <20190317174946.28ee07a5@windsurf>
 <CAFtSRGCunAxWP2VizuD_yY8zzqnOqksuzKz-F=PiFHv+JdOb7A@mail.gmail.com>
Message-ID: <20190318110547.177223b9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrien,

Thanks for the feedback.

On Sun, 17 Mar 2019 20:56:16 +0100

> I use BIRD with s6 on production and I didn't take the time
> to write a correct start-stop-daemon script for it yet. In all cases,
> BIRD only needs root privileges at startup and he can switch
> to a less privileged one when started with -u USER -g GROUP.
> 
> If your prefer to wait, I'll resubmit a patch with the start-stop-daemon
> script later.

Yes, indeed, I think it makes more sense to have the new user created
together with an init script that actually uses it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
