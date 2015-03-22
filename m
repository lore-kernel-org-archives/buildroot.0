From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 22 Mar 2015 20:00:03 +0100
Subject: [Buildroot] The C++11 issue
References: <20150321102858.5e13ec41@free-electrons.com>
 <550D8592.5040300@mind.be>
Message-ID: <XnsA465CB7526576berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote in 
news:550D8592.5040300 at mind.be:

>  BTW, now that bfin internal compiler is gone, can we deprecate 4.5?

Hi,

upcoming Kodi 15.0 Isengard fails to compile with BR2_GCC_VERSION_4_5_X on 
BR2_ARCH="x86_64" due to C++11 features being included in Kodi source code. 
Using BR2_GCC_VERSION_4_7_X it works fine however. So I vote for removing 
gcc-4.5.x support from Buildroot.

Regards, Bernd
