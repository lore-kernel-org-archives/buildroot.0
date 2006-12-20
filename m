From: Rory Vieira <rory.vieira@gmail.com>
Date: Wed, 20 Dec 2006 14:32:10 +0100
Subject: [Buildroot] Errors using gcc in target
Message-ID: <5e15b0e10612200532w2682ecc9pe44dbdbaab20249e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

My excuses for the 'flood' of questions, but here's another one...
I have succesfully built my buildroot, and am trying to configure a
source package...
After checking for gcc it tries a simple compile program:

int
main ()
{

  ;
  return 0;
}

and returns:
configure:1721: gcc    conftest.c  >&5
/usr/bin/ld: crt1.o: No such file: No such file or directory
collect2: ld returned 1 exit status

crt0.o is installed in /usr/lib on the target

Any ideas are very welcome
Cheers,
-- 
Rory Slegtenhorst
rory dot slegtenhorst at gmail dot com
