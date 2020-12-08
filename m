From: Andreas Hilse <andreas.hilse@googlemail.com>
Date: Tue, 8 Dec 2020 21:41:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to version 2.1.2
In-Reply-To: <20201205222153.75769040@windsurf.home>
References: <20200812160843.24064-1-andreas.hilse@googlemail.com>
 <20201205222153.75769040@windsurf.home>
Message-ID: <CANabuZeh=hZ6sUdq-2NOnt7AnS70bmb=ZQkxemFKuHc3-AtiyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> I think the commit log should mention that the license has changed,
> with a link to https://github.com/troglobit/sysklogd/releases/tag/v2.1.
Will do when I find out how to update the patch (have to read doc again).

> syslog.c:448:27: error: ?O_CLOEXEC? undeclared (first use in this
function)
>    O_WRONLY | O_NONBLOCK | O_CLOEXEC, 0)) >= 0) {
This is fixable by CFLAGS="-D_GNU_SOURCE" e.g. in MAKE_OPTS.
I contacted the sysklogd maintainer through github. Waiting on a response.

Best regards
Andreas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201208/219e82b8/attachment.html>
