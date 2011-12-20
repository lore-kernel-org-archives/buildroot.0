From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Dec 2011 22:14:29 +0100
Subject: [Buildroot] [RFC] Add systemd to buildroot
In-Reply-To: <4ECD673A.7000405@free-electrons.com>
References: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
 <CAAfyv35NYoDU9qaGT-LBbS++b_s+0e7LWAp=DCYzFUn90E9aKA@mail.gmail.com>
 <4ECD673A.7000405@free-electrons.com>
Message-ID: <201112202214.29933.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 23 November 2011 22:35:54 Maxime Ripard wrote:
> > thanks for good work. I don't see any patches where adding systemd
> > specific services.
> > Are they in your queue or this was only basic patches?
> 
> It's still a work to be done.
> Once we will have a nice way to add systemd to buildroot, which is not 
> sure yet, I guess we will add the systemd units one unit at a time.

 It would help to accept the systemd changes if you would add a systemd 
definition for at least one package.  That helps us to review the impact
of the changes.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
