From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Oct 2011 14:59:45 +0200
Subject: [Buildroot] [PATCH] /etc/profile: read in /etc/profile.d/*.sh
	files
In-Reply-To: <2973c12cb594abeecc60.1318932277@devws108> (Thomas De
 Schampheleire's message of "Wed, 19 Oct 2011 09:36:02 +0200")
References: <2973c12cb594abeecc60.1318932277@devws108>
Message-ID: <87ty6tp8zh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> For custom projects, it is more maintainable to add custom
 Thomas> profile settings in a separate file, than directly in
 Thomas> /etc/profile.

Committed, thanks.

-- 
Bye, Peter Korsgaard
