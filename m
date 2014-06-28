From: Panahi Parsa <panahi.par3a@gmail.com>
Date: Sat, 28 Jun 2014 09:15:18 +0430
Subject: [Buildroot] Glibc LD_LIBRARAY_PATH error
In-Reply-To: <20140628000126.4bfd6329@free-electrons.com>
References: <CAMhj5sakLa9ROf4RVO2N1rhRx+4du=j3X8OL5rLVRAUQRnFS+Q@mail.gmail.com>
 <20140628000126.4bfd6329@free-electrons.com>
Message-ID: <CAMhj5sZkdpe+mrTzvxqrwK=-tOoyG4nvobM48PJJpw3oFcb5CA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi I've sent the output of env command in my buildroot folder

parsa at parsa-System-Product-Name:~/Software/Buildroot/buildroot$ env
SSH_AGENT_PID=1485
GPG_AGENT_INFO=/tmp/keyring-eVmLaZ/gpg:0:1
TERM=xterm
SHELL=/bin/bash
XDG_SESSION_COOKIE=755755d7fc9010640f716d5300000002-1403930328.483565-169998459
GENICAM_ROOT_V2_3=/opt/pylon3/genicam
WINDOWID=56623110
OLDPWD=/home/parsa
GNOME_KEYRING_CONTROL=/tmp/keyring-eVmLaZ
PYLON_ROOT=/opt/pylon3
USER=parsa
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:
LD_LIBRARY_PATH=/opt/pylon3/lib64:/opt/pylon3/genicam/bin/Linux64_x64:/opt/pylon3/genicam/bin/Linux64_x64/GenApi/Generic::/home/parsa/Software/OPENCV/build/lib:/usr/local/lib:/home/parsa/Software/OPENCV/build/lib
LIBGL_DRIVERS_PATH=/usr/lib/fglrx/dri:/usr/lib/x86_64-linux-gnu/dri:/usr/lib/dri:/usr/lib32/fglrx/dri:/usr/lib/i386-linux-gnu/dri
XDG_SESSION_PATH=/org/freedesktop/DisplayManager/Session0
XDG_SEAT_PATH=/org/freedesktop/DisplayManager/Seat0
SSH_AUTH_SOCK=/tmp/keyring-eVmLaZ/ssh
SESSION_MANAGER=local/parsa-System-Product-Name:@
/tmp/.ICE-unix/1411,unix/parsa-System-Product-Name:/tmp/.ICE-unix/1411
DEFAULTS_PATH=/usr/share/gconf/ubuntu.default.path
XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg
PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
DESKTOP_SESSION=ubuntu
PWD=/home/parsa/Software/Buildroot/buildroot
LANG=en_US.UTF-8
MANDATORY_PATH=/usr/share/gconf/ubuntu.mandatory.path
UBUNTU_MENUPROXY=libappmenu.so
COMPIZ_CONFIG_PROFILE=ubuntu
GDMSESSION=ubuntu
SHLVL=1
HOME=/home/parsa
LANGUAGE=en_US:en
GENICAM_CACHE=/opt/pylon3/xml_cache
GNOME_DESKTOP_SESSION_ID=this-is-deprecated
LOGNAME=parsa
XDG_DATA_DIRS=/usr/share/ubuntu:/usr/share/gnome:/usr/local/share/:/usr/share/
DBUS_SESSION_BUS_ADDRESS=unix:abstract=/tmp/dbus-jgoqOyqvSk,guid=d428726f5fec304f7689199500000005
LESSOPEN=| /usr/bin/lesspipe %s
DISPLAY=:0.0
XDG_CURRENT_DESKTOP=Unity
LESSCLOSE=/usr/bin/lesspipe %s %s
COLORTERM=gnome-terminal
XAUTHORITY=/home/parsa/.Xauthority
_=/usr/bin/env
parsa at parsa-System-Product-Name:~/Software/Buildroot/buildroot$



2014-06-28 2:31 GMT+04:30 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Panahi Parsa,
>
> On Sat, 28 Jun 2014 00:58:31 +0430, Panahi Parsa wrote:
>
> > *** These auxiliary programs are missing or incompatible versions:
> makeinfo
> > autoconf
> > *** some features will be disabled.
> > *** Check the INSTALL file for required versions.
> > checking LD_LIBRARY_PATH variable... contains current directory
> > configure: error:
> > *** LD_LIBRARY_PATH shouldn't contain the current directory when
> > *** building glibc. Please change the environment variable
> > *** and run configure again.
> > make: ***
> >
> [/home/parsa/Software/Buildroot/buildroot/output/build/glibc-2.18/.stamp_configured]
> > Error 1
> >
> > parsa at parsa-System-Product-Name:~/Software/Buildroot/buildroot$
> >
> > It seems that I should change LD_LIBARAY_PATH to include glibc
> environment
> > variables !! Since I'm new to buildroot I don't know how I should do
> this.
> >
> > Is there some one who can tell me the steps to solve this problem ?
>
> Can you post the output of the "env" command in the terminal you used
> Buildroot?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 


Parsa Panahi
D?partement de g?nie ?lectrique
?tudiant de l'?lectronique num?rique
Sharif Universit? de Technologie - T?h?ran - Iran
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140628/28df6ec8/attachment.html>
