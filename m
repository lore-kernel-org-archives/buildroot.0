From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jun 2016 22:51:41 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-bad: remove obsolete gettext
	patch
In-Reply-To: <1465893927-8430-1-git-send-email-marcin.nowakowski@imgtec.com>
 (Marcin Nowakowski's message of "Tue, 14 Jun 2016 10:45:27 +0200")
References: <1465893927-8430-1-git-send-email-marcin.nowakowski@imgtec.com>
Message-ID: <877fdrv6hu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcin" == Marcin Nowakowski <marcin.nowakowski@imgtec.com> writes:

 > The patch to update gettext version is unnecessary, as gettexttize is
 > enabled and therefore an always up-to-date version is used.

Hmm, but why are we patching this + autoreconf/gettextize in the first
place when we don't do it for the other gstreamer1 packages?

Looking back in the history, I see Yann added GETTEXTIZE in 368eab1833
to work around an issue doing autoreconf, but now we don't seem to have
any reason to autoreconf in the first place any more.

-- 
Bye, Peter Korsgaard
