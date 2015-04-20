From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 20 Apr 2015 07:55:07 -0500
Subject: [Buildroot] how to point at a massive local archive of S/W
	tarballs
In-Reply-To: <alpine.LFD.2.11.1504151638400.26183@localhost>
References: <alpine.LFD.2.11.1504151638400.26183@localhost>
Message-ID: <CANQCQpZ59t+dZZDB35+870pppUk_xuiGvgyEVKNdarc1pc19Ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robert,

On Wed, Apr 15, 2015 at 3:42 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   (NOTE: first of a few fairly basic questions as i play with the
> current buildroot after being away for a bit.)
>
>   if i'm starting a new build, how can i take advantage of the
> gigabytes of S/W tarballs i've collected for doing OE/yocto project
> builds?
>
>   i want to set the equivalent of a local mirror -- would i set a
> value in the "Primary download site" config option, with the format
> "file:///pathname/to/all/my/tarballs"?

Take a look here:
http://buildroot.org/downloads/manual/manual.html#_advanced_usage
Section 8.11.4 describes a method for setting a download location via
env or capturing it as part of a targets configuration.

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com
