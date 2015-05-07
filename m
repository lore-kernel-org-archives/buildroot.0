From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 May 2015 08:51:29 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150507000102.1c814d69@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 7 May 2015 00:01:02 +0200")
References: <20150506063017.6B6A61015C1@stock.ovh.net>
 <20150506094236.114894a2@free-electrons.com>
 <20150507000102.1c814d69@free-electrons.com>
Message-ID: <87r3qsnamm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > My suggestion would therefore be to change host-autoconf-archive to
 > install in a path that isn't in the standard include path of
 > autoreconf/aclocal. This way, no package doing AUTORECONF = YES would
 > be "polluted" by the presence of host-autoconf-archive. And only those
 > few packages that actually need host-autoconf-archive can add the
 > relevant -I option to AUTORECONF_OPTS. I've tested that installing
 > host-autoconf-archive to a custom location works, but I haven't tested
 > the other part of the solution.

 > Thoughts?

Yes, that also sounds like the best approach to me. Will you send a
patch to do so?

-- 
Bye, Peter Korsgaard
