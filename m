From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Mar 2013 14:17:35 +0100
Subject: [Buildroot] [PATCH 14/34] qt5base: add GUI support
In-Reply-To: <CAKAx1cjksGgYxpvF21ZLuV25Tz3UQmsBPi6c2NHXrJ_EAGivpg@mail.gmail.com>
References: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362601396-32250-15-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAKAx1chXW8jSsZcP66YxoSYSzdPvXtk3+eyq3UJCpvR21FDCVg@mail.gmail.com>
 <20130307141159.126aaf1b@skate>
 <CAKAx1cjksGgYxpvF21ZLuV25Tz3UQmsBPi6c2NHXrJ_EAGivpg@mail.gmail.com>
Message-ID: <20130307141735.1c617cd8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lionel Orry,

On Thu, 7 Mar 2013 14:14:17 +0100, Lionel Orry wrote:

> You're welcome. While I'm at it, I switched to 5.0.1 and noticed the
> "-fast" option to configure is not recognised.

Yes, I also moved to 5.0.1. I simply removed this option. I will repost
an updated version of my patch set, hopefully this afternoon.

> I suppose the
> equivalent options are (extract from ./configure -help):
> 
>  *  -process ........... Generate only a top-level Makefile.
>     -fully-process ..... Generate Makefiles for the entire Qt tree.
>     -dont-process ...... Do not generate any Makefiles.

Hum, yes, maybe. Not sure which one is the correct choice, though. I've
just left the default value and it seems to work nicely.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
