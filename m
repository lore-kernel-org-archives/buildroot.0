From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Sep 2012 09:30:37 +0200
Subject: [Buildroot] [PATCH 07/10] pulseaudio: remove dependency on
 gettext
In-Reply-To: <20120921005422.11838.41552.stgit@localhost>
References: <20120921004927.11838.37292.stgit@localhost>
 <20120921005422.11838.41552.stgit@localhost>
Message-ID: <20120921093037.4f88187c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle \(Essensium/Mind\),

On Fri, 21 Sep 2012 02:54:22 +0200, Arnout Vandecappelle
\(Essensium/Mind\) wrote:
> From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> The dependency on gettext is only due to libglib2, not due to
> portaudio itself.  It works fine without gettext if libglib2 is
> not selected.

This description doesn't match what the patch is doing. The description
says that you remove the gettext dependency, but the patch only changes
the dependency to a _IF_LOCALE dependency.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
