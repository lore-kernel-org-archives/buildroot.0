From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 31 Jan 2017 17:05:05 +1300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-01-29
In-Reply-To: <20170130072925.E0B0B20CD6@mail.free-electrons.com>
References: <20170130072925.E0B0B20CD6@mail.free-electrons.com>
Message-ID: <CAFOYHZDvPhhUcSn3G3tGG0sOLZcesWJL0a0USCnFT-pbsh=Qhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 30, 2017 at 8:29 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
>          arm |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/dde54ccefa32af1f46a4af5b6caed822c3209dfc

Looks like a common problem with musl-libc not liking applications
that include linux headers directly. I've reported the issue upstream
https://github.com/appneta/tcpreplay/issues/275 if I get time I'll see
if I submit a fix for it.
