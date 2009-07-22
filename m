From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Jul 2009 10:22:41 +0000 (UTC)
Subject: [Buildroot] [Bug 387] Tremor not installed to toolchain
In-Reply-To: <bug-387-163@https.bugs.busybox.net/>
References: <bug-387-163@https.bugs.busybox.net/>
Message-ID: <20090722102241.AD1A77781D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=387


Sven Neumann <s.neumann@raumfeld.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |




--- Comment #4 from Sven Neumann <s.neumann@raumfeld.com>  2009-07-22 10:22:41 UTC ---
I am sorry, but it is not fixed:

Making all in vorbis
make[4]: Entering directory
`/home/sven/git/buildroot/build_arm/gst-plugins-base-0.10.23/ext/vorbis'
  CC    vorbis.o
  CC    vorbisparse.o
  CC    vorbisenc.o
  CC    vorbisdec.o
  CC    vorbistag.o
  LINK  libgstvorbis.la
/usr/lib/libvorbisenc.so: could not read symbols: File in wrong format
collect2: ld returned 1 exit status

gst-plugins-base tries to link against libvorbisenc.so and as far as I can see
this library is not provided by tremor.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
