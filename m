From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 11 Feb 2013 18:34:26 +0100
Subject: [Buildroot] Buildroot at ELC: review/suggestions needed
In-Reply-To: <201302100047.23872.yann.morin.1998@free.fr>
References: <20130209195709.323b9f5e@skate>
 <201302100047.23872.yann.morin.1998@free.fr>
Message-ID: <51192BA2.4040901@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E. MORIN wrote:
> Thomas, All,
>
> On Saturday 09 February 2013 Thomas Petazzoni wrote:
>>   * Review the Buildroot poster I've made. The poster will be printed by
>>     the event organizers in big format, and I've tried to highlight the
>>     main fact about Buildroot, and recent developments.
>>     Seehttp://free-electrons.com/~thomas/pub/buildroot-poster.png
> I would add arrows to the lines, to further ensure that what is
> dark-green and brown is input to buildroot, while what is gray
> is the output.

To be precise, the toolchain can be either in input or an output toBR.
But I don't think it can be represented graphically in a nice and
understandable way...

About the poster: the official site is buildroot.net, not .org.

A few features that might not be obvious to a casual visitor and might be
interesting to put in the slideshow:
  - handles dependenciesautomatically;
  - does not require root permissions;
  - regular 3-months releases;
  - There is a comprehensive and maintained manual (have it handy in html
    and PDF!);
  - List some well-known supported boards (panda, sheevaplug, at91*,
    beaglebone...).

For the demo, I would keep ready a couple package's .mk files to show 
how one
can easily add a package. IMHO the simplicity in adding packages is the
number 1 BR feature for a beginner.
I suggest to show one of the simplest available, that does need any tweak
(e.g. sdparm, 6 non-empty lines, 0 patches!) and a moderately complex one
(maybe logrotate, grep, libpng?).

Luca
