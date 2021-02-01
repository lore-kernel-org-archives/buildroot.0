From: Joachim Wiberg <troglobit@gmail.com>
Date: Mon, 01 Feb 2021 11:16:33 +0100
Subject: [Buildroot] [RFC PATCH 0/1] package/sysklogd: proposal to
 update default syslog.conf
In-Reply-To: <87bld4p1gm.fsf@dell.be.48ers.dk>
References: <20210130135203.159451-1-troglobit@gmail.com>
 <20210131231346.6bce24e3@windsurf.home> <87sg6gg1d9.fsf@gmail.com>
 <20210201090431.48d3508e@windsurf.home> <87bld4p1gm.fsf@dell.be.48ers.dk>
Message-ID: <87pn1kf5z2.fsf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 01, 2021 at 10:43, Peter Korsgaard <peter@korsgaard.com> wrote:
> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>  > On Sun, 31 Jan 2021 23:58:26 +0100
>  > Joachim Wiberg <troglobit@gmail.com> wrote:
>  >> My main question was if there was any specific reason to sticking with
>  >> the old habits of only using /var/log/messages, as BusyBox syslogd does,
>  >> or if every logging package is free to have its own defalts?  Within
>  >> reason, of course.  I'm just a bit concerned with breaking peoples
>  >> defaults, even though they can just provide their own.
>  >> 
>  >> If it's OK to change for sysklogd, I can post a new patch that drops
>  >> the locallay maintained .conf and instead installs the sysklogd one.
>  > I don't have a strong opinion on what should be our default
>  > configuration for sysklogd. Peter, do you have any comments ?
> Not really. People can still use a custom configuration file in their
> rootfs overlay, so I don't have a problem with changing the default
> configuration to be more "normal", E.G. what upstream suggests.

All right, thank you so much to both of you for your time!

I'll prepare a patch to drop the local syslog.conf and use the one
shipped with sysklod.


Best regards
 /Joachim
