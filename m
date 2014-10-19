From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 13:29:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/avahi: use upstream-provided
 systemd files
In-Reply-To: <CAGduivz_LYa13bVhHh_-cUZp=jt+HapK8xq0LQoez-jpjT8e5w@mail.gmail.com>
References: <1413573042-6638-1-git-send-email-dywi@mailerd.de>
 <20141019131552.239fe12f@free-electrons.com>
 <CAGduivz_LYa13bVhHh_-cUZp=jt+HapK8xq0LQoez-jpjT8e5w@mail.gmail.com>
Message-ID: <20141019132909.1846f3ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 19 Oct 2014 13:22:10 +0200, Maxime Hadjinlian wrote:

> > Someone to look into this?
> It's already done, look at the avahi_tmpfiles.conf, it's made
> explicitly for that.

Aaah, ok. Not easy to spot when you're not a systemd guy :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
