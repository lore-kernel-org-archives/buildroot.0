From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Sep 2015 08:19:12 +0200
Subject: [Buildroot] [PATCH v3 1/1] wpa_supplicant: fix static link with
	readline
In-Reply-To: <1442181166-5754-1-git-send-email-0intro@gmail.com> (David du
 Colombier's message of "Sun, 13 Sep 2015 23:52:46 +0200")
References: <1442181166-5754-1-git-send-email-0intro@gmail.com>
Message-ID: <87egi1a5gf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David du Colombier <0intro@gmail.com> writes:

 > When linking statically, the order of libraries on the
 > linker command matters, since readline depends on ncurses.

 > Signed-off-by: David du Colombier <0intro@gmail.com>

Committed, thanks.

I wanted to add a reference to upstream as you mentioned that you had
submitted it upstream, but I don't see it on the list:

http://lists.shmoo.com/pipermail/hostap/2015-September/thread.html

What happened?

-- 
Bye, Peter Korsgaard
