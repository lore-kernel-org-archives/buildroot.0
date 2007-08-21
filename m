From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 20 Aug 2007 18:34:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	atngw100/target_skeleton atngw100/target etc...
Message-ID: <20070821013441.98D34A610B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-20 18:34:40 -0700 (Mon, 20 Aug 2007)
New Revision: 19596

Log:
additional skeleton for AVR32

Added:
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/bin/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/boot/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/config/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/dev/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/home/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/lib/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/mnt/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/opt/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bash_history
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bash_logout
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bash_profile
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bashrc
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/sbin/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/tmp/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/cache/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/lib/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/lib/pcmcia/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/lock/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/log/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/pcmcia/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/run/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/spool/
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/tmp/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/bin/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/boot/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/config/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/dev/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/home/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/lib/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/mnt/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/opt/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/proc/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bash_history
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bash_logout
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bash_profile
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bashrc
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/sbin/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/tmp/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/cache/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/lib/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/lib/pcmcia/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/lock/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/log/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/pcmcia/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/run/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/spool/
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/tmp/


Changeset:
Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bash_history
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bash_logout
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bash_logout	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bash_logout	2007-08-21 01:34:40 UTC (rev 19596)
@@ -0,0 +1,7 @@
+# ~/.bash_logout: executed by bash(1) when login shell exits.
+
+# when leaving the console clear the screen to increase privacy
+
+case "`tty`" in
+    /dev/tty[0-9]*) clear
+esac

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bash_profile
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bash_profile	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bash_profile	2007-08-21 01:34:40 UTC (rev 19596)
@@ -0,0 +1,15 @@
+# .bash_profile
+
+export PATH=\
+/bin:\
+/sbin:\
+/usr/bin:\
+/usr/sbin:\
+/usr/bin/X11:\
+/usr/local/bin
+
+umask 022
+
+if [ -f ~/.bashrc ]; then
+    source ~/.bashrc
+fi

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bashrc
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bashrc	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bashrc	2007-08-21 01:34:40 UTC (rev 19596)
@@ -0,0 +1,48 @@
+# ~/.bashrc: executed by bash(1) for non-login interactive shells.
+
+export PATH=\
+/bin:\
+/sbin:\
+/usr/bin:\
+/usr/sbin:\
+/usr/bin/X11:\
+/usr/local/bin
+
+# If running interactively, then:
+if [ "$PS1" ]; then
+
+    if [ "$BASH" ]; then
+	export PS1="[\u@\h \W]\\$ "
+    else
+      if [ "`id -u`" -eq 0 ]; then 
+	export PS1='# '
+      else
+	export PS1='$ '
+      fi
+    fi
+
+    export USER=`id -un`
+    export LOGNAME=$USER
+    export HOSTNAME=`/bin/hostname`
+    export HISTSIZE=1000
+    export HISTFILESIZE=1000
+    export PAGER='/bin/more '
+    export EDITOR='/bin/vi'
+    export INPUTRC=/etc/inputrc
+    export DMALLOC_OPTIONS=debug=0x34f47d83,inter=100,log=logfile
+    export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:';
+
+    ### Some aliases
+    alias ps2='ps facux '
+    alias ps1='ps faxo "%U %t %p %a" '
+    alias af='ps af'
+    alias cls='clear'
+    alias ll='/bin/ls --color=tty -laFh'
+    alias ls='/bin/ls --color=tty -F'
+    alias df='df -h'
+    alias indent='indent -bad -bap -bbo -nbc -br -brs -c33 -cd33 -ncdb -ce -ci4 -cli0 -cp33 -cs -d0 -di1 -nfc1 -nfca -hnl -i4 -ip0 -l75 -lp -npcs -npsl -nsc -nsob -nss -ts4 '
+    #alias bc='bc -l'
+    alias minicom='minicom -c on'
+    alias calc='calc -Cd '
+    alias bc='calc -Cd '
+fi;

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bash_history
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bash_logout
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bash_logout	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bash_logout	2007-08-21 01:34:40 UTC (rev 19596)
@@ -0,0 +1,7 @@
+# ~/.bash_logout: executed by bash(1) when login shell exits.
+
+# when leaving the console clear the screen to increase privacy
+
+case "`tty`" in
+    /dev/tty[0-9]*) clear
+esac

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bash_profile
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bash_profile	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bash_profile	2007-08-21 01:34:40 UTC (rev 19596)
@@ -0,0 +1,15 @@
+# .bash_profile
+
+export PATH=\
+/bin:\
+/sbin:\
+/usr/bin:\
+/usr/sbin:\
+/usr/bin/X11:\
+/usr/local/bin
+
+umask 022
+
+if [ -f ~/.bashrc ]; then
+    source ~/.bashrc
+fi

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bashrc
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bashrc	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bashrc	2007-08-21 01:34:40 UTC (rev 19596)
@@ -0,0 +1,48 @@
+# ~/.bashrc: executed by bash(1) for non-login interactive shells.
+
+export PATH=\
+/bin:\
+/sbin:\
+/usr/bin:\
+/usr/sbin:\
+/usr/bin/X11:\
+/usr/local/bin
+
+# If running interactively, then:
+if [ "$PS1" ]; then
+
+    if [ "$BASH" ]; then
+	export PS1="[\u@\h \W]\\$ "
+    else
+      if [ "`id -u`" -eq 0 ]; then 
+	export PS1='# '
+      else
+	export PS1='$ '
+      fi
+    fi
+
+    export USER=`id -un`
+    export LOGNAME=$USER
+    export HOSTNAME=`/bin/hostname`
+    export HISTSIZE=1000
+    export HISTFILESIZE=1000
+    export PAGER='/bin/more '
+    export EDITOR='/bin/vi'
+    export INPUTRC=/etc/inputrc
+    export DMALLOC_OPTIONS=debug=0x34f47d83,inter=100,log=logfile
+    export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:';
+
+    ### Some aliases
+    alias ps2='ps facux '
+    alias ps1='ps faxo "%U %t %p %a" '
+    alias af='ps af'
+    alias cls='clear'
+    alias ll='/bin/ls --color=tty -laFh'
+    alias ls='/bin/ls --color=tty -F'
+    alias df='df -h'
+    alias indent='indent -bad -bap -bbo -nbc -br -brs -c33 -cd33 -ncdb -ce -ci4 -cli0 -cp33 -cs -d0 -di1 -nfc1 -nfca -hnl -i4 -ip0 -l75 -lp -npcs -npsl -nsc -nsob -nss -ts4 '
+    #alias bc='bc -l'
+    alias minicom='minicom -c on'
+    alias calc='calc -Cd '
+    alias bc='calc -Cd '
+fi;
