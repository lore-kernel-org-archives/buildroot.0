From: Woody Wu <narkewoody@gmail.com>
Date: Wed, 24 Jul 2013 16:46:23 +0800
Subject: [Buildroot] How to manually download a package?
Message-ID: <20130724084623.GA14235@zuhnb712.ap.bm.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I enabled vim, but the download site seems unreachable from my place.
But I can find the vim-7.3 from other mirror sites.  Problem is, I am
not sure how should I put my manually downloaded file and more
important, what's the package tarball file name buildroot is expecting.

Below are build error message when buildroot failed to download vim:

>>> vim 699f8d8f096d Downloading
abort: error: Network is unreachable
--2013-07-24 16:20:53--
http://sources.buildroot.net//vim-699f8d8f096d.tar.gz

Does it mean that I just need to download the vim-7.3.tar.gz and rename
it as vim-699f8xxxx.tar.gz before put it in the buildroot download
directory?

Thanks in advance.

-- 
I can't go back to yesterday - because I was a different person then
