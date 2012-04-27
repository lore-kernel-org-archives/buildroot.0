From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Apr 2012 23:23:03 +0200
Subject: [Buildroot] Buildroot fails to build when selecting build
	packages
In-Reply-To: <CAG6aBkV4xjdsXcvq-AssYQ1nOw0XiBiEjTZvi2rowStdfSCJNg@mail.gmail.com>
References: <CAG6aBkV4xjdsXcvq-AssYQ1nOw0XiBiEjTZvi2rowStdfSCJNg@mail.gmail.com>
Message-ID: <201204272323.03890.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 25 April 2012 01:49:44 Nigel Sollars wrote:
> The build fails since as a dependency glib2 is selected this fails with a
> dbus like so:

 Works for me.  Can you run a 'make savedefconfig' and send the defconfig
file?  Does the problem also occur after a clean rebuild?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
