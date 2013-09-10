From: Woody Wu <narkewoody@gmail.com>
Date: Tue, 10 Sep 2013 10:57:44 +0800
Subject: [Buildroot] How to copy locale data?
Message-ID: <20130910025744.GA7837@zuhnb712.ap.bm.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

My target is ARM little-endian. My host is i686 little-endian. Can I
copy locale data from my host to target root filesystem? Are those data
binary compatible between the two architecture?

In my target, I found there are two places can hold locale data,
/usr/share/locale and /usr/share/X11/locale. What is for what?

I also tried to enable "Generate Locale Data" in buildroot (toolchain
submenu), but I found it seems nothing generated for me (except a "C"
directory).

Many thanks if you can help.

-- 
I can't go back to yesterday - because I was a different person then
