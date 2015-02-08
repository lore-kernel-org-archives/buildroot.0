From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Feb 2015 21:45:40 +0100
Subject: [Buildroot] [PATCH] package/erlang: fix build issue with pcre
	package
In-Reply-To: <1423414640-30254-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Sun, 8 Feb 2015 17:57:20 +0100")
References: <1423414640-30254-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87d25k5dzf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > If the pcre package is build before erlang, the erlang's build
 > system use pcre.h from pcre package instead of using pcre.h bundled
 > by Erlang.

 > Erlang use an old version of this file which is incompatible
 > with the upstream one.

 > http://autobuild.buildroot.net/results/cbd/cbd8b54eef535f19d7d400fd269af1b3571d6143/build-end.log

 > And many more.

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
