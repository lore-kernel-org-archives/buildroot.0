From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:57:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdk-pixbuf: security bump to
 version 2.36.12
In-Reply-To: <20200811101213.2117766-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine via buildroot's message of "Tue, 11 Aug 2020 12:12:13 +0200")
References: <20200811101213.2117766-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2lyvk4h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine via buildroot <buildroot@busybox.net> writes:

 > - Fix CVE-2017-6312: Integer overflow in io-ico.c in gdk-pixbuf allows
 >   context-dependent attackers to cause a denial of service (segmentation
 >   fault and application crash) via a crafted image entry offset in an
 >   ICO file, which triggers an out-of-bounds read, related to compiler
 >   optimizations.
 > - Fix CVE-2017-6313: Integer underflow in the load_resources function in
 >   io-icns.c in gdk-pixbuf allows context-dependent attackers to cause a
 >   denial of service (out-of-bounds read and program crash) via a crafted
 >   image entry size in an ICO file.
 > - Fix CVE-2017-6314: The make_available_at_least function in io-tiff.c
 >   in gdk-pixbuf allows context-dependent attackers to cause a denial of
 >   service (infinite loop) via a large TIFF file.

 > Also update indentation in hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
