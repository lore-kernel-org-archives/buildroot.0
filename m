From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 May 2009 14:21:26 +0200
Subject: [Buildroot] Obtaining old SVN revision
In-Reply-To: <4A0ABA5D.7040308@free.fr> (Cyril HAENEL's message of "Wed\,
	13 May 2009 14\:17\:33 +0200")
References: <4A0AA1D9.1030808@carallon.com>
	<87r5ytrzke.fsf@macbook.be.48ers.dk> <4A0ABA5D.7040308@free.fr>
Message-ID: <87eiutry61.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cyril" == Cyril HAENEL <chaenel@free.fr> writes:

Hi,

 Cyril> I was using svn too but last week I tried the last git version and
 Cyril> everything is OK for my application (arm based).
 Cyril> How can I know the revision number it is to be able to come back to it
 Cyril> in some week for example ?

You can see the latest version of your tree using git show (before you
run git pull to get updates), and the information also gets stored in
your rootfs (in /etc/br-version).

-- 
Bye, Peter Korsgaard
