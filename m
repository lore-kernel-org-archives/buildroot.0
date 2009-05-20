From: Julien Boibessot <julien.boibessot@free.fr>
Date: Wed, 20 May 2009 08:55:49 +0200
Subject: [Buildroot] Menuconfig error
In-Reply-To: <c40c2dd60905191349x675cf5b3rd3c46f20b14d0d27@mail.gmail.com>
References: <c40c2dd60905191349x675cf5b3rd3c46f20b14d0d27@mail.gmail.com>
Message-ID: <4A13A975.8060802@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Remy,

LeMoal Remy a ?crit :
> Hi All,
>
> Using the 5/19/2009-rc2 release on a Jaunty Ubuntu, I add this error 
> message runing 'make menuconfig'. Buildroot had worked previously... 
> i'm just a newbie so is my Ubuntu update or else that's wrong ? Thanks !
>
> ...
> Dans le fichier inclus ? partir de lxdialog/checklist.c:24:
> lxdialog/dialog.h:32:20: erreur: curses.h : Aucun fichier ou dossier 
> de ce type
> In file included from lxdialog/checklist.c:24:
> lxdialog/dialog.h:97: erreur: expected specifier-qualifier-list before 
> ?chtype?
On a fresh intalled (K/X)Ubuntu, I need to do the following to have a 
running Buildroot:
http://www.armadeus.com/wiki/index.php?title=LinuxInstall#Prerequisites_for_Linux_installation

For your particular case, you probably miss libncurses5-dev...

Regards,
Julien
