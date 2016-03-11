From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Mar 2016 12:38:09 +0100
Subject: [Buildroot] [PATCH] mesa3d: add intel gallium driver support
In-Reply-To: <56E2A91A.1030509@zacarias.com.ar> (Gustavo Zacarias's message of
 "Fri, 11 Mar 2016 08:16:42 -0300")
References: <1457632891-4354-1-git-send-email-gustavo@zacarias.com.ar>
 <8760wum7dj.fsf@dell.be.48ers.dk> <56E1D44F.70807@zacarias.com.ar>
 <3979rcxl7o.ln2@ID-313208.user.individual.net>
 <871t7hjmol.fsf@dell.be.48ers.dk> <56E2A91A.1030509@zacarias.com.ar>
Message-ID: <87wpp9i6se.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > On 11/03/16 08:09, Peter Korsgaard wrote:
 >> Hi,
 >> 
 >> > To sum up: Yes, it is possible to build a i915 gallium driver in mesa3d,
 >> > but who needs it? That's the reason I never implemented a Config.in
 >> > option for it, but it will not hurt having one ;)
 >> 
 >> Ok, that was more of less also my understanding. Gustavoz, what do you
 >> need the gallium driver for?

 > "DRI drivers need X.org" -> wayland, plus libgtk3 with it as backend.
 > All that libepoxy effort would go to /dev/null otherwise.
 > Regards.

I actually think the comment is wrong. Googling around for wayland /
mesa / intel seems to show a bunch of references to people using dri
drivers and not gallium:

https://wayland.freedesktop.org/building.html
https://lists.freedesktop.org/archives/wayland-devel/2011-February/000702.html
https://lists.freedesktop.org/archives/wayland-devel/2012-August/004832.html
https://gist.github.com/tmpvar/6218568

-- 
Venlig hilsen,
Peter Korsgaard 
