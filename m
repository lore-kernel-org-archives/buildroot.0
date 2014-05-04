From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  4 May 2014 12:25:10 +0000 (UTC)
Subject: [Buildroot] [Bug 6950] Full unicode support in ncurses
In-Reply-To: <bug-6950-163@https.bugs.busybox.net/>
References: <bug-6950-163@https.bugs.busybox.net/>
Message-ID: <20140504122510.9783B9C477@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6950

--- Comment #2 from prezi77 at wp.pl 2014-05-04 12:25:09 UTC ---
(In reply to comment #1)

> So according to me, we either accept Jeremy's patch (possible refreshed) or
> someone should implement the split package approach.
> 
I suggest you to use Jeremy's patch. It has one import advantage: it exists.
Ncurses is uses by approximately 60 packages:



alsa-utils
aumix
avrdude
bash
bmon
bwm-ng
cvs
dialog
dropwatch
erlang
gdb
gnupg
gpm
gpsd
gptfdisk
htop
httping
iftop
joe
kismet
lame
latencytop
lcdproc
less
libcdio
libedit
liboping
lua
luaposix
lvm2
minicom
mtr
mutt
mysql
nano
ncdu
ncftp
ncmpcpp
ncurses
ola
procps
proftpd
psmisc
python
python3
readline
rtorrent
ruby
screen
sqlcipher
sqlite
statserial
tmux
tn5250
uemacs
util-linux
vim
xterm
zsh

I suppose it is possible to patch makefiles to link to ncursesw. Some of them
uses ncursesw natively.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
