From: Belisko Marek <marek.belisko@gmail.com>
Date: Sat, 8 Dec 2012 22:59:40 +0100
Subject: [Buildroot] udisks package dependency troubles
Message-ID: <CAAfyv34M1_Otm+s_4Fo8dZgzxAUh2wsnQXAsZF2QwBRuiSB=LA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to add udisks to buildroot but having problem with dependencies.
udisks 2.0.0 need glib2 >= 2.31.13 but currently in BR is just 2.30 version.

I try several times to bump glib2 version to 2.31 also to latest but I
always have a problem with compilation
e.g. with latest:

resources.c:495:12: warning: variable ?loaded_file? set but not used
[-Wunused-but-set-variable]
  CC     proxy-test.o
  CC     inet-address.o
/bin/sh: line 1: 27341 Segmentation fault      (core dumped)
../../gio/glib-compile-resources --target=test.gresource --sourcedir=.
test.gresource.xml
make[7]: *** [test.gresource] Error 139
make[7]: *** Waiting for unfinished jobs....

I've found Thomas Petazzoni  was working on adding udisks to BR but I
cannot find any patches.
Any ideas how to proceed?

Thanks,

mbe

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
