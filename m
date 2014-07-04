From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jul 2014 23:19:55 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bump to version 214
In-Reply-To: <53B6FF9F.9020107@mind.be> (Arnout Vandecappelle's message of
 "Fri, 04 Jul 2014 21:25:19 +0200")
References: <1404070537-14255-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140703132119.014619c0@free-electrons.com>
 <53B6FF9F.9020107@mind.be>
Message-ID: <874myw6cuc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  This is probably a symptom of systemd moving to the everything-in-/usr
 > filesystem layout [1]. So we can expect more of that in the future.

 >  This everything-in-/usr actually doesn't sound like a bad idea. TLDR: move
 > everything in /bin and /lib to /usr/bin and /usr/lib, and make symlinks /bin ->
 > /usr/bin etc. Would be really trivial for us to implement.

Don't forget /sbin + /usr/sbin - But Yes, I mentioned it on IRC the
other day as well. Could solve these kind of issues for good.

Anyone against it?

-- 
Bye, Peter Korsgaard
