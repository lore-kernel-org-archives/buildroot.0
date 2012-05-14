From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 May 2012 22:30:29 +0200
Subject: [Buildroot] [PATCH 1/2] libtorrent: new package
In-Reply-To: <4FAE710C.4020706@mind.be> (Arnout Vandecappelle's message of
 "Sat, 12 May 2012 16:17:48 +0200")
References: <1336765188-20743-1-git-send-email-gustavo@zacarias.com.ar>
 <4FADA2BA.3010507@mind.be>
 <d72c000db80dab016beb8feec3f3a870@zacarias.com.ar>
 <4FAE710C.4020706@mind.be>
Message-ID: <87wr4ey07u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:


 Arnout>  You could add 'select BR2_PACKAGE_OPENSSL' to rtorrent
 Arnout> instead.  But indeed it is probably pointless.

Still, I would prefer if we do it correctly, E.G. make openssl optional
in libtorrent, and select it by rtorrent.

-- 
Bye, Peter Korsgaard
