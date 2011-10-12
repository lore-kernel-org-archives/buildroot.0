From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Oct 2011 09:06:35 +0200
Subject: [Buildroot] [PATCH] manual: refactor the targets into GENDOC
	macro.
In-Reply-To: <CAAXf6LWoAi27Ku99vkodMVNFErudYGOWaF6WitQNELgRQWRJBg@mail.gmail.com>
References: <201110112257.11996.arnout@mind.be>
 <1318366792-13507-1-git-send-email-arnout@mind.be>
 <CAAXf6LWoAi27Ku99vkodMVNFErudYGOWaF6WitQNELgRQWRJBg@mail.gmail.com>
Message-ID: <201110120906.36175.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 12 October 2011 09:04:55, Thomas De Schampheleire wrote:
> Regardless of these specific changes, wouldn't it be cleaner to put
> all these make targets for the documentation in a separate .mk file
> (or Makefile.something.in), included from Makefile? This keeps the
> Makefile more to-the-point, since the creation of the documentation is
> not what most people are interested in.

 Yeah, I was going to suggest that as well but it got lost between all the other comments :-)

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
