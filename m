From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Jun 2020 15:18:12 +0200
Subject: [Buildroot] [PATCH] package/perl: bump to version 5.30.2
In-Reply-To: <20200321130240.16914-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sat, 21 Mar 2020 14:02:40 +0100")
References: <20200321130240.16914-1-francois.perrad@gadz.org>
Message-ID: <87d06hd2sr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed to 2020.02.x, thanks as it fixes a build issue with GCC 10 on
the host.

I also see that there is a 5.30.3 release with security fixes, care to
send a patch for that?

https://perldoc.pl/perldelta

-- 
Bye, Peter Korsgaard
