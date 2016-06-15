From: Marcin Nowakowski <Marcin.Nowakowski@imgtec.com>
Date: Wed, 15 Jun 2016 12:21:49 +0000
Subject: [Buildroot] [PATCH] gst1-plugins-bad: remove obsolete gettext
	patch
In-Reply-To: <877fdrv6hu.fsf@dell.be.48ers.dk>
References: <1465893927-8430-1-git-send-email-marcin.nowakowski@imgtec.com>
 <877fdrv6hu.fsf@dell.be.48ers.dk>
Message-ID: <6AAECB0035080A468CD3789966C9E87499A9D000@WRMAIL01.wr.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: Peter Korsgaard
> 
> Hmm, but why are we patching this + autoreconf/gettextize in the first
> place when we don't do it for the other gstreamer1 packages?
> 
> Looking back in the history, I see Yann added GETTEXTIZE in 368eab1833
> to work around an issue doing autoreconf, but now we don't seem to have
> any reason to autoreconf in the first place any more.

It does indeed look like it's unnecessary now - in that case I'll post a new patch that removes the patch file as well as removes autoreconf and gettextize steps.

Marcin
