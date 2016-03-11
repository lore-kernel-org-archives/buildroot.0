From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Mar 2016 08:16:42 -0300
Subject: [Buildroot] [PATCH] mesa3d: add intel gallium driver support
In-Reply-To: <871t7hjmol.fsf@dell.be.48ers.dk>
References: <1457632891-4354-1-git-send-email-gustavo@zacarias.com.ar>
 <8760wum7dj.fsf@dell.be.48ers.dk> <56E1D44F.70807@zacarias.com.ar>
 <3979rcxl7o.ln2@ID-313208.user.individual.net>
 <871t7hjmol.fsf@dell.be.48ers.dk>
Message-ID: <56E2A91A.1030509@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/16 08:09, Peter Korsgaard wrote:

> Hi,
>
>   > To sum up: Yes, it is possible to build a i915 gallium driver in mesa3d,
>   > but who needs it? That's the reason I never implemented a Config.in
>   > option for it, but it will not hurt having one ;)
>
> Ok, that was more of less also my understanding. Gustavoz, what do you
> need the gallium driver for?

"DRI drivers need X.org" -> wayland, plus libgtk3 with it as backend.
All that libepoxy effort would go to /dev/null otherwise.
Regards.
