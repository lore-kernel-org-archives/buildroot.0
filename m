From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 15:06:20 +0100
Subject: [Buildroot] Analysis of build results for 2018-02-25
In-Reply-To: <20180226140029.45325514@windsurf.lan> (Thomas Petazzoni's
 message of "Mon, 26 Feb 2018 14:00:29 +0100")
References: <20180226070010.28C8620727@mail.bootlin.com>
 <20180226113319.7e3bcf6b@windsurf.lan>
 <87fu5nsyrg.fsf@dell.be.48ers.dk>
 <20180226140029.45325514@windsurf.lan>
Message-ID: <87bmgbsv4z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> > I guess this is fixed by the old patches submitted by Bernd, which are
 >> > still in patchwork. I'm still not super happy about these patches,
 >> > though (as I already expressed as a reply to those patches).  
 >> 
 >> Agreed, but what are the alternatives? Make the package unavailable for
 >> x86 or drop it completely, as it is afaik dead upstream.

 > mplayer upstream is dead ? If that is the case, then indeed we should
 > just take those patches as-is.

I haven't followed development in details, but the latest mplayer
release is more than 2 years old and several forks exists (E.G. mpv).


 >> > tools/qtextboundaryfinder.cpp:444:1: internal compiler error: in
 >> > validate_condition_mode, at config/rs6000/rs6000.c:18074  
 >> 
 >> > Someone to test this with newer gcc versions ?  
 >> 
 >> Or deprecate qt4?

 > Just because it's broken on powerpc?

Well, mainly because it is no longer maintained upstream. Even Debian is
removing Qt4:

https://wiki.debian.org/Qt4Removal

 >> Agreed, considering how close we are getting to 2018.02.

 > We also have the issue that systemd is currently broken anyway (see the
 > report from J?r?my Rosen, the attempt to fix it from Jan and Romain). I
 > don't think we can release until this problem is resolved.

Agreed!

-- 
Bye, Peter Korsgaard
