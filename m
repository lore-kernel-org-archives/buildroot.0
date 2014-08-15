From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 16 Aug 2014 00:34:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/matchbox: Depends on MMU
In-Reply-To: <1407588855-24583-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sat, 9 Aug 2014 14:54:15 +0200")
References: <1407588855-24583-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <878ump1ix1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes matchbox-panel:
 > http://autobuild.buildroot.net/results/8d5/8d5ad404fab7ec2a501972ba9c08b0109e420b80/

 > and matchbox-desktop:
 > mbdesktop_win_plugin.o: In function `mbdesktop_win_plugin_load':
 > /home/br/br/output/build/matchbox-desktop-0.9.1/src/mbdesktop_win_plugin.c:22: undefined reference to `_fork'

 > and matchbox-wm:
 > matchbox-remote.o: In function `mbcommand':
 > /home/fli4l/br3/output/build/matchbox-wm-1.2/src/matchbox-remote.c:147: undefined reference to `_fork'

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
