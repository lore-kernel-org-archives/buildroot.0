From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Oct 2013 22:28:15 +0200
Subject: [Buildroot] [PATCH 1/4] weston: improve selection of compositor
In-Reply-To: <87d0cdc19da1adb5a2d1fb92ae8cd99287594968.1381770790.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 14 Oct 2013 19:13:27 +0200")
References: <cover.1381770790.git.yann.morin.1998@free.fr>
 <cover.1381770790.git.yann.morin.1998@free.fr>
 <87d0cdc19da1adb5a2d1fb92ae8cd99287594968.1381770790.git.yann.morin.1998@free.fr>
Message-ID: <87zjqboaw0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Yann> The way the compositor was selected in Config.in was counter-intuitive,
 Yann> because the fbdev backend is selected by default even if a different one
 Yann> is available.

 Yann> Instead, select the fbdev backend only if no other one was selected by
 Yann> the user.

 Yann> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Yann> [yann.morin.1998 at free.fr: don't reorder entries, keep alphabetical sort]
 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
