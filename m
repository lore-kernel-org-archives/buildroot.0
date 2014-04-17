From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 21:52:28 +0200
Subject: [Buildroot] [PATCH v2 1/1] xbmc: Fix compile error with missing
 host-gettext
In-Reply-To: <1397712379-3474-1-git-send-email-bernd.kuhls@t-online.de>
References: <1397712379-3474-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140417215228.62b122fc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 17 Apr 2014 07:26:19 +0200, Bernd Kuhls wrote:
> autoreconf -vif lib/cpluff
> autoreconf: Entering directory `lib/cpluff'
> autoreconf: running: autopoint --force
> Can't exec "autopoint": No such file or directory at /home/buildroot/output/host/usr/share/autoconf/Autom4te/FileUtils.pm line 345.
> autoreconf: failed to run autopoint: No such file or directory
> autoreconf: autopoint is needed because this package uses Gettext
> make[1]: *** [lib/cpluff/configure] Error 1
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
