From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 7 May 2014 13:53:07 +0200
Subject: [Buildroot] CMake requires ncurses
Message-ID: <CAHkwnC-kaMHjsD9GjPiDLdx5vda2CKAnDVXPX-qAUx+r01MCAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

because the cmake package requires the ncurses library, what is best
thing to do?
add to the buildroot manual that is a mandatory package? right now
it's just a optional dependency for configuration interface.
Maybe also add a check in dependencies.sh too?

Regards
-- 
Fabio Porcedda
