From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jan 2012 00:04:02 +0100
Subject: [Buildroot] [PATCH 2/2] New package: kmod
In-Reply-To: <201201180000.22317.arnout@mind.be> (Arnout Vandecappelle's
 message of "Wed, 18 Jan 2012 00:00:21 +0100")
References: <1326726276-8442-1-git-send-email-yegorslists@googlemail.com>
 <87ty3upg82.fsf@macbook.be.48ers.dk>
 <CAGm1_ks1+PmxFWF6CAA7Y4FSaWVKSaOvRZXwQRVXti=ojMcRbA@mail.gmail.com>
 <201201180000.22317.arnout@mind.be>
Message-ID: <871uqyorrx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On Tuesday 17 January 2012 23:13:08 Yegor Yefremov wrote:
 >> As we came to this topic, what is your opinion on adding /run? It also
 >> became udev's dependency.

 Arnout>  IIRC /run basically replaces /var/run in Fedora, Debian, SuSE
 Arnout> and others.  Since we anyway symlink /var/run to /tmp, we can
 Arnout> easily do the same for /run.

That's my understanding as well. I don't have any issues with adding a
/run symlink to fs/skeleton.


-- 
Bye, Peter Korsgaard
