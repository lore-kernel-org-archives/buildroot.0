From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Mar 2012 23:07:08 +0100
Subject: [Buildroot] [PATCH] gpsd: dbus interface requires dbus-glib
In-Reply-To: <1330902968-11886-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Mon, 5 Mar 2012 00:16:08 +0100")
References: <1330902968-11886-1-git-send-email-arnout@mind.be>
Message-ID: <87fwdlmlir.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> gpsd uses dbus-glib as the dbus interface, so it should only be
 Arnout> built if libglib2 has been selected.  To simplify things, build
 Arnout> dbus support only if dbus-glib is selected.

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> ---
 Arnout> v2:
 Arnout> The select of DBUS_GLIB in Config.in created a circular
 Arnout> dependency.

Committed, thanks. It makes it easier for me if you also add [PATCHv2]
in the subject, so I can easily see this replaces your earlier patch.

-- 
Bye, Peter Korsgaard
