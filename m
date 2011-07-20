From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 20 Jul 2011 19:41:45 +0200
Subject: [Buildroot] devtmpfs and initramfs
In-Reply-To: <201107201300.39616.arnout@mind.be> (Arnout Vandecappelle's
 message of "Wed, 20 Jul 2011 13:00:38 +0200")
References: <201107191222.19313.arnout@mind.be>
 <201107201057.48006.arnout@mind.be>
 <874o2h2pif.fsf@macbook.be.48ers.dk>
 <201107201300.39616.arnout@mind.be>
Message-ID: <87tyag26jq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout>  But next thing you know, some other piece of Makefile also
 Arnout> wants to do something with /init...

What would that be? /init is specific to initramfs.

-- 
Bye, Peter Korsgaard
