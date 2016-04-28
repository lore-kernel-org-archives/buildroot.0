From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Apr 2016 08:33:02 -0300
Subject: [Buildroot] [PATCH v2] mpv: new package
In-Reply-To: <20160428133031.39b4a7bf@free-electrons.com>
References: <1461762722-10026-1-git-send-email-gustavo@zacarias.com.ar>
 <20160428131945.1fb83683@free-electrons.com>
 <5721F276.5040304@zacarias.com.ar>
 <20160428133031.39b4a7bf@free-electrons.com>
Message-ID: <5721F4EE.8050509@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/04/16 08:30, Thomas Petazzoni wrote:

> The ones related to j1() being not available, I guess so. But many of
> the failures are related to the detection of wayland, sdl1, sdl2. Are
> those also related to the XSI_MATH thing?
>
> Thomas

No, wayland requires xkbcommon, i've already sent a patch, i'm looking 
at the sdl failures shortly.
Regards.
