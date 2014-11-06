From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 06 Nov 2014 14:32:13 -0300
Subject: [Buildroot] [PATCH 0/7] [RFC] systemV init without busybox
	series
In-Reply-To: <20141106182413.198106d0@free-electrons.com>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
 <20141106182413.198106d0@free-electrons.com>
Message-ID: <545BB09D.2080805@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/06/2014 02:24 PM, Thomas Petazzoni wrote:

> Have you seen "[PATCH] start-stop-daemon: new package" already
> submitted by Karoly Kasza a few days ago?

I didn't notice it before, just seen it, this series was made about two
weeks ago.
That's one way to do it, but it's a bit hackish.
In my version of the package i download the dpkg tarball (downloads
ain't expensive these days and it isn't some super big tarball either),
configure stripping almost everything and just build/install
start-stop-daemon, everything without any nasting patching.
I didn't send it because i want feedback on naming, for all intents and
purposes it's just a start-stop-daemon package even though it downloads
the dpkg tarball.
Dpkg tools can be built from what i've seen but the build time &
footprint will be far bigger, and i think it will send a wrong
message/expectations.
Regards.
