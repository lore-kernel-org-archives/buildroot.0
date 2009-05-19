From: LeMoal Remy <remylemoal@gmail.com>
Date: Tue, 19 May 2009 22:49:01 +0200
Subject: [Buildroot] Menuconfig error
Message-ID: <c40c2dd60905191349x675cf5b3rd3c46f20b14d0d27@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Using the 5/19/2009-rc2 release on a Jaunty Ubuntu, I add this error message
runing 'make menuconfig'. Buildroot had worked previously... i'm just a
newbie so is my Ubuntu update or else that's wrong ? Thanks !

remy at ubuntu:~/Bureau/buildroot$ make menuconfig
make CC="/usr/bin/gcc" -C package/config conf mconf
make[1]: entrant dans le r?pertoire ?
/home/remy/Bureau/buildroot/package/config ?
/usr/bin/gcc -DCURSES_LOC="<curses.h>" -DLOCALE  -g -O2  -c conf.c -o conf.o
conf.c: In function ?conf_askvalue?:
conf.c:112: attention : ignoring return value of ?fgets?, declared with
attribute warn_unused_result
conf.c: In function ?conf_choice?:
conf.c:363: attention : ignoring return value of ?fgets?, declared with
attribute warn_unused_result
/usr/bin/gcc -DCURSES_LOC="<curses.h>" -DLOCALE  -g -O2  -c kxgettext.c -o
kxgettext.o
/usr/bin/gcc -DCURSES_LOC="<curses.h>" -DLOCALE  -g -O2  -c
lxdialog/checklist.c -o lxdialog/checklist.o
Dans le fichier inclus ? partir de lxdialog/checklist.c:24:
lxdialog/dialog.h:32:20: erreur: curses.h : Aucun fichier ou dossier de ce
type
In file included from lxdialog/checklist.c:24:
lxdialog/dialog.h:97: erreur: expected specifier-qualifier-list before
?chtype?
lxdialog/dialog.h:187: erreur: expected ?)? before ?*? token
lxdialog/dialog.h:194: erreur: expected ?)? before ?*? token
lxdialog/dialog.h:196: erreur: expected ?)? before ?*? token
lxdialog/dialog.h:197: erreur: expected ?)? before ?*? token
lxdialog/dialog.h:198: erreur: expected ?)? before ?*? token
lxdialog/dialog.h:199: erreur: expected ?)? before ?*? token
lxdialog/dialog.h:201: erreur: expected ?)? before ?*? token
lxdialog/checklist.c:31: erreur: expected ?)? before ?*? token
lxdialog/checklist.c:59: erreur: expected ?)? before ?*? token
lxdialog/checklist.c:95: erreur: expected ?)? before ?*? token
lxdialog/checklist.c: In function ?dialog_checklist?:
lxdialog/checklist.c:116: erreur: ?WINDOW? undeclared (first use in this
function)
lxdialog/checklist.c:116: erreur: (Each undeclared identifier is reported
only once
lxdialog/checklist.c:116: erreur: for each function it appears in.)
lxdialog/checklist.c:116: erreur: ?dialog? undeclared (first use in this
function)
lxdialog/checklist.c:116: erreur: ?list? undeclared (first use in this
function)
lxdialog/checklist.c:129: erreur: ?stdscr? undeclared (first use in this
function)
lxdialog/checklist.c:130: erreur: ?KEY_MAX? undeclared (first use in this
function)
lxdialog/checklist.c:137: erreur: ?COLS? undeclared (first use in this
function)
lxdialog/checklist.c:138: erreur: ?LINES? undeclared (first use in this
function)
lxdialog/checklist.c:143: erreur: ?TRUE? undeclared (first use in this
function)
lxdialog/checklist.c:146: erreur: ?struct dialog_color? has no member named
?atr?
lxdialog/checklist.c:146: erreur: ?struct dialog_color? has no member named
?atr?
lxdialog/checklist.c:147: erreur: ?struct dialog_color? has no member named
?atr?
lxdialog/checklist.c:151: erreur: ?struct dialog_color? has no member named
?atr?
lxdialog/checklist.c:156: erreur: ?struct dialog_color? has no member named
?atr?
lxdialog/checklist.c:171: erreur: ?struct dialog_color? has no member named
?atr?
lxdialog/checklist.c:171: erreur: ?struct dialog_color? has no member named
?atr?
lxdialog/checklist.c:210: erreur: ?KEY_UP? undeclared (first use in this
function)
lxdialog/checklist.c:210: erreur: ?KEY_DOWN? undeclared (first use in this
function)
lxdialog/checklist.c:220: erreur: ?FALSE? undeclared (first use in this
function)
lxdialog/checklist.c:297: erreur: ?KEY_LEFT? undeclared (first use in this
function)
lxdialog/checklist.c:298: erreur: ?KEY_RIGHT? undeclared (first use in this
function)
lxdialog/checklist.c:312: erreur: ?KEY_RESIZE? undeclared (first use in this
function)
make[1]: *** [lxdialog/checklist.o] Erreur 1
make[1]: quittant le r?pertoire ? /home/remy/Bureau/buildroot/package/config
?
make: *** [package/config/mconf] Erreur 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090519/ac4322a1/attachment.htm>
