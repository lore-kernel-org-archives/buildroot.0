From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Wed, 3 Aug 2011 18:24:33 +0200
Subject: [Buildroot] [Bug] alsamixer: can't load library 'libform.so.5'
Message-ID: <20110803182433.3dda34b1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, noticed this little bug right now :

alsamixer (from alsa-utils) complains that there's a missing library on
the generated system : 'libform.so.5', which is normally part of
ncurses.

the lib is generated in output/build/ncurses-5.7/lib/, but is
apparently not copied in output/target/usr/lib
