From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Jul 2011 23:11:44 +0200
Subject: [Buildroot] [PATCH] gst-plugins-ugly: fix dependencies for mad
	MP3 decoder plug-in
In-Reply-To: <1310769180-1179-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Sat, 16 Jul 2011 00:33:00 +0200")
References: <1310628453-3966-3-git-send-email-s.neumann@raumfeld.com>
 <1310769180-1179-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87sjpvv0xb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> The mad plug-in depends on libid3tag. This dependency used to be
 Sven> implicit by selecting the id3tag plug-in. Now that this plug-in
 Sven> is not any longer part of gst-plugins-ugly we need an explicit
 Sven> dependency on libid3tag.

Committed, thanks.

-- 
Bye, Peter Korsgaard
