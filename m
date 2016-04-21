From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Apr 2016 17:32:38 -0300
Subject: [Buildroot] [PATCH 1/2] uclibc/defconfig: enable XSI math
In-Reply-To: <5719349F.9080404@mind.be>
References: <1461246857-5634-1-git-send-email-gustavo@zacarias.com.ar>
 <5719349F.9080404@mind.be>
Message-ID: <571938E6.3020109@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/04/16 17:14, Arnout Vandecappelle wrote:

>   Unfortunately the autobuilder toolchains don't have this enabled yet,
> so we'll get failures...

Indeed, but at some point they'll need to update, the alternative would 
be artificially excluding mpv building with uclibc.

>   The Blackfin toolchain does have this enabled, but the 2015.12 ARC
> toolchain doesn't.

We can exclude ARC i think, at least until/if the toolchain is updated, 
but maybe it doesn't make much sense for it.

>   Anyway, it's probably a good idea to have this enabled by default.

Well, mpv is a nice replacement for mplayer which is actually maintained 
and has ton of new features, i've tested wayland/drm/x11/opengl outputs 
and it works just fine.
Regards.
