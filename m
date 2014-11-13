From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Nov 2014 10:22:28 +0100
Subject: [Buildroot] [PATCH] xbmc: use github call
In-Reply-To: <CAGduivyWS2GGwyQuyawojxU0-Tg1O1BDtorP9ULZ_c6o7NxcUg@mail.gmail.com>
 (Maxime Hadjinlian's message of "Thu, 13 Nov 2014 10:18:41 +0100")
References: <1413138060-1146-1-git-send-email-maxime.hadjinlian@gmail.com>
 <87d28rjysb.fsf@dell.be.48ers.dk>
 <CAGduivyWS2GGwyQuyawojxU0-Tg1O1BDtorP9ULZ_c6o7NxcUg@mail.gmail.com>
Message-ID: <87zjbvihez.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

Hi,

 >> So what's going on?
 > As it appeared on IRC yesterday also, it seems that github changed
 > *again* their download schemes silently, so every package using the
 > github-helper are currently broken.
 > We need to devise a new github helper, or something to fix this urgently.
 > Keep this patch in the queue, if we keep the github-helper, it should
 > work then (or need some rework, depending on the solution we chose)

Argh :/

Did anybody ever try contacting github to ask them to not break this
again and again?

-- 
Bye, Peter Korsgaard 
