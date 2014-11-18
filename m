From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 21:55:31 +0100
Subject: [Buildroot] [PATCH] pakage/erlang: fix host build without
	termcap (curses) library
In-Reply-To: <1416263596-11129-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 17 Nov 2014 23:33:16 +0100")
References: <1416263596-11129-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87d28kp6t8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > We do not need termcap (curses) support in the host variant of erlang.
 > Fixes a bunch of autobuild failures;
 >     http://autobuild.buildroot.net/results/4be/4bef658b6815929058c769037211f7e0fc8d1f9c/
 >     http://autobuild.buildroot.net/results/726/72619ed15590a3a5a41b7c398d973766ecab0a2e/
 >     http://autobuild.buildroot.net/results/366/366439438549d5f7656be72f71dae3bb5f99c6b2/
 >     ...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Nathaniel Roach <nroach44@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
