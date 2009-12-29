From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Dec 2009 12:07:49 +0000 (UTC)
Subject: [Buildroot] [Bug 831] New: 4x6.bdf: Command not found
Message-ID: <bug-831-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=831

              Host: opensuse 10.3
            Target: x86
             Build: buildroot
           Summary: 4x6.bdf: Command not found
           Product: buildroot
           Version: 2009.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: max at olo.com.pl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=869)
 --> (https://bugs.busybox.net/attachment.cgi?id=869)
My config

I attached my config

I have error when buildroot make font-misc-misc 1.0.0

---------------------------------
>>> xfont_font-misc-misc 1.0.0 Building
PATH="/home/buildroot-2009.08/toolchain_build_i686/bin:/home/buildroot-2009.08/build_i686/host_dir/bin:/home/buildroot-2009.08/build_i686/host_dir/usr/bin:/home/buildroot-2009.08/build_i686/staging_dir/bin:/home/buildroot-2009.08/build_i686/staging_dir/usr/bin:/sbin:/usr/sbin:/usr/local/sbin:/opt/gnome/sbin:/usr/local/bin:/usr/bin:/usr/X11R6/bin:/bin:/usr/games:/opt/gnome/bin:/opt/kde3/bin:/usr/lib/mit/bin:/usr/lib/mit/sbin:/home/PROGRAMY/java/bin:/home/PROGRAMY/apache-ant/bin:/home/G/depot_tools:/home/PROGRAMY/java/bin:/home/PROGRAMY/apache-ant/bin:/home/G/depot_tools:/home/PROGRAMY/java/bin:/home/PROGRAMY/apache-ant/bin:/home/G/depot_tools"
 /usr/bin/make -j1  -C
/home/buildroot-2009.08/build_i686/xfont_font-misc-misc-1.0.0/
make[1]: Entering directory
`/home/buildroot-2009.08/build_i686/xfont_font-misc-misc-1.0.0'
/usr/bin/bdftopcf -t 4x6.bdf | gzip > 4x6.pcf.gz
/usr/bin/bdftopcf -t 5x7.bdf | gzip > 5x7.pcf.gz
/usr/bin/bdftopcf -t 5x8.bdf | gzip > 5x8.pcf.gz
/usr/bin/bdftopcf -t 6x9.bdf | gzip > 6x9.pcf.gz
/usr/bin/bdftopcf -t 6x10.bdf | gzip > 6x10.pcf.gz
/usr/bin/bdftopcf -t 6x12.bdf | gzip > 6x12.pcf.gz
/usr/bin/bdftopcf -t 6x13.bdf | gzip > 6x13.pcf.gz
/usr/bin/bdftopcf -t 6x13B.bdf | gzip > 6x13B.pcf.gz
/usr/bin/bdftopcf -t 6x13O.bdf | gzip > 6x13O.pcf.gz
/usr/bin/bdftopcf -t 7x13.bdf | gzip > 7x13.pcf.gz
/usr/bin/bdftopcf -t 7x13B.bdf | gzip > 7x13B.pcf.gz
/usr/bin/bdftopcf -t 7x13O.bdf | gzip > 7x13O.pcf.gz
/usr/bin/bdftopcf -t 7x14.bdf | gzip > 7x14.pcf.gz
/usr/bin/bdftopcf -t 7x14B.bdf | gzip > 7x14B.pcf.gz
/usr/bin/bdftopcf -t 8x13.bdf | gzip > 8x13.pcf.gz
/usr/bin/bdftopcf -t 8x13B.bdf | gzip > 8x13B.pcf.gz
/usr/bin/bdftopcf -t 8x13O.bdf | gzip > 8x13O.pcf.gz
/usr/bin/bdftopcf -t 9x15.bdf | gzip > 9x15.pcf.gz
/usr/bin/bdftopcf -t 9x15B.bdf | gzip > 9x15B.pcf.gz
/usr/bin/bdftopcf -t 9x18.bdf | gzip > 9x18.pcf.gz
/usr/bin/bdftopcf -t 9x18B.bdf | gzip > 9x18B.pcf.gz
/usr/bin/bdftopcf -t 10x20.bdf | gzip > 10x20.pcf.gz
/usr/bin/bdftopcf -t 12x13ja.bdf | gzip > 12x13ja.pcf.gz
/usr/bin/bdftopcf -t 18x18ja.bdf | gzip > 18x18ja.pcf.gz
/usr/bin/bdftopcf -t 18x18ko.bdf | gzip > 18x18ko.pcf.gz
/usr/bin/bdftopcf -t k14.bdf | gzip > k14.pcf.gz
/usr/bin/bdftopcf -t nil2.bdf | gzip > nil2.pcf.gz
4x6.bdf
/home/buildroot-2009.08/build_i686/staging_dir/usr/lib/X11/fonts/util/map-ISO8859-1
ISO8859-1
make[1]: 4x6.bdf: Command not found
make[1]: *** [4x6-ISO8859-1.bdf] Error 127
make[1]: Leaving directory
`/home/buildroot-2009.08/build_i686/xfont_font-misc-misc-1.0.0'
make: ***
[/home/buildroot-2009.08/build_i686/xfont_font-misc-misc-1.0.0/.stamp_built]
Error 2
---------------------------------

I used version from GIT but i have this same error

I tested version: 2009.08, 2009.11 and from repository


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
