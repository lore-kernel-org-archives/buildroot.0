From: Mike Zick <minimod@morethan.org>
Date: Tue, 30 Sep 2014 11:58:56 -0500
Subject: [Buildroot] Reducing buildroot compile times by reusing
 toolchain?
In-Reply-To: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A484CBB@AMEHLEX02.ehl.pri>
References: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A484C07@AMEHLEX02.ehl.pri>
 <20140930113024.74091a8f@free-electrons.com>
 <A2A6A18A7161D44FBCA90D5B3AF90A2E5A484CBB@AMEHLEX02.ehl.pri>
Message-ID: <20140930115856.6d378af9@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 30 Sep 2014 15:04:56 +0000
"Paassen, Hiram van" <Hiram.van.Paassen@mastervolt.com> wrote:

> Our build using eglibc, systemd and python takes (including toolchain)
> 45 min on my i7 quad-core laptop. At least half of that seems to be
> the toolchain and other "host" tools. I prefer a faster machine but I
> suspect my boss won't give that to me given that I already have the
> fastest machine in the office.
>

That might be I/O limited -
Get Boss to buy you a server-grade, fast, SSD for the laptop.
