From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Dec 2012 18:20:47 +0100
Subject: [Buildroot] [Bug 5750] buildroot-2012.11 while building X11 for
 ARM, errors on  xlib_libX11-1.4.2
In-Reply-To: <20121205075957.00AEA99A07@busybox.osuosl.org>
References: <bug-5750-163@https.bugs.busybox.net/>
 <20121205075957.00AEA99A07@busybox.osuosl.org>
Message-ID: <50BF826F.4060004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/12 08:59, bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=5750
>
> --- Comment #1 from Thomas Petazzoni<thomas.petazzoni@free-electrons.com>  2012-12-05 07:59:54 UTC ---
> For some complicated reason, using Buildroot in a directory stored under /usr
> doesn't work. We will work on fixing that, but in the mean time, please build
> from /home/something, /opt or anything else, but not from a subdirectory of
> /usr.

  We should at least have a check for that...

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
