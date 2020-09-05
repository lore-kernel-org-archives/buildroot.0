From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 5 Sep 2020 23:17:14 +0200
Subject: [Buildroot] package/strace --enable-mpers=no
Message-ID: <CAEyMn7a8hML1-mFD11YMWoZ7VM+YHLNJQyBJEpg5x2jJx2qXRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch, Hi All,

I faced an issue when building strace for aarch64 on my host where a
32bit arm toolchain is installed. As discussed with Brandon on IRC
strace seems to find the 32bit toolchain because of the
--enable-mpers=check option and fails with that.

Do you think it makes sense to set --enable-mpers=no since buildroot
does not support multi personality toolchains?

[1] https://pastebin.com/8uaFHgyP
[2] https://pastebin.com/GeSYYvnB

-- 
Heiko
