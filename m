From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Mar 2012 10:39:35 -0300
Subject: [Buildroot] [PATCH v2] ushare: new package
In-Reply-To: <20120321142102.5c5999a6@skate>
References: <1332335538-23508-1-git-send-email-gustavo@zacarias.com.ar>
 <20120321142102.5c5999a6@skate>
Message-ID: <5f0396764c1dc201f01ae3853a534d33@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-21 10:21, Thomas Petazzoni wrote:

> With GENTARGETS, xxx_BUILD_CMDS is empty by default. Are you sure 
> this
> builds?

Yes, install triggers build.

> Also, can you add a comment just before USHARE_CONFIGURE_CMDS saying
> that despite the appearance, autotools are not used. However, I am 
> sure
> in the future many people will wonder why AUTOTARGETS was not used.

Sure, but should it be for other packages as well?
Same things applies to ffmpeg and probably others (the ushare configure 
is an old/strip version from ffmpeg).
Though ffmpeg is using AUTOTARGETS and overriding CONFIGURE_CMDS...
Regards.
