From: Woody Wu <narkewoody@gmail.com>
Date: Sat, 27 Jul 2013 14:52:14 +0800
Subject: [Buildroot] no 'ldconfig' and '/etc/ld.so.conf' not parsed
In-Reply-To: <20130726074326.GA24146@zuhnb712.ap.bm.net>
References: <20130726074326.GA24146@zuhnb712.ap.bm.net>
Message-ID: <20130727065214.GB4893@zuhnb712.ap.bm.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

In my genearted root fs, I found two issue related to ld:

1. There is no ldconfig in my target root filesystem, and I don't find
out where is the option to enable build this binary for me.

2. I put a /etc/ld.so.conf in my target filesystem, but I believe that
it is not get parsed. What's the reason and how to make it work?

Thanks in advance.

-- 
I can't go back to yesterday - because I was a different person then
