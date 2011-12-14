From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Dec 2011 09:31:23 +0100
Subject: [Buildroot] Make problem on 64-bit linux with CS 2009q1
In-Reply-To: <201112140808.49826.arnout@mind.be>
References: <4EE1CB14.9010802@free.fr>
 <CAHUNapQTUqg5Vo4c57Yg4OqG+FL6trcjZBPJsEzfE0xGc=cdvQ@mail.gmail.com>
 <87d3bttw2v.fsf@macbook.be.48ers.dk>
 <201112140808.49826.arnout@mind.be>
Message-ID: <20111214093123.17a1d8da@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 14 Dec 2011 08:08:49 +0100,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  Or better yet, to use our own and prime it with all the generic
> configure variables.  That may bring down the huge amount of time
> spent in running configure scripts...

We tried to share the configure variables in the past by sharing the
configure cache between packages and this has proven to be very
unreliable. However, sharing some really generic variables that are
known to be understood by all configure scripts in the same way, is a
possibility.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
