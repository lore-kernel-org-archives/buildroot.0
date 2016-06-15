From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 16:02:43 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-bad: remove obsolete gettext
	patch
In-Reply-To: <6AAECB0035080A468CD3789966C9E87499A9D000@WRMAIL01.wr.imgtec.org>
 (Marcin Nowakowski's message of "Wed, 15 Jun 2016 12:21:49 +0000")
References: <1465893927-8430-1-git-send-email-marcin.nowakowski@imgtec.com>
 <877fdrv6hu.fsf@dell.be.48ers.dk>
 <6AAECB0035080A468CD3789966C9E87499A9D000@WRMAIL01.wr.imgtec.org>
Message-ID: <87eg7ysg70.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcin" == Marcin Nowakowski <Marcin.Nowakowski@imgtec.com> writes:

 >> From: Peter Korsgaard
 >> 
 >> Hmm, but why are we patching this + autoreconf/gettextize in the first
 >> place when we don't do it for the other gstreamer1 packages?
 >> 
 >> Looking back in the history, I see Yann added GETTEXTIZE in 368eab1833
 >> to work around an issue doing autoreconf, but now we don't seem to have
 >> any reason to autoreconf in the first place any more.

 > It does indeed look like it's unnecessary now - in that case I'll post
 > a new patch that removes the patch file as well as removes autoreconf
 > and gettextize steps.

Great, thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
