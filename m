From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Mar 2016 12:09:30 +0100
Subject: [Buildroot] [PATCH] mesa3d: add intel gallium driver support
In-Reply-To: <3979rcxl7o.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Thu, 10 Mar 2016 22:58:27 +0100")
References: <1457632891-4354-1-git-send-email-gustavo@zacarias.com.ar>
 <8760wum7dj.fsf@dell.be.48ers.dk> <56E1D44F.70807@zacarias.com.ar>
 <3979rcxl7o.ln2@ID-313208.user.individual.net>
Message-ID: <871t7hjmol.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

Hi,

 > To sum up: Yes, it is possible to build a i915 gallium driver in mesa3d, 
 > but who needs it? That's the reason I never implemented a Config.in 
 > option for it, but it will not hurt having one ;)

Ok, that was more of less also my understanding. Gustavoz, what do you
need the gallium driver for?

-- 
Bye, Peter Korsgaard
