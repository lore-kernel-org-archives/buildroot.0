From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Mar 2015 09:36:56 +0100
Subject: [Buildroot] [PATCH 00/13] autobuild-run: python3 compat and
 misc improvements
In-Reply-To: <06D2305A-C43B-470D-A1C3-941D44CB367B@gmail.com>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
 <20150226110858.183d31f3@free-electrons.com>
 <EEF2BEA7-3CA2-4250-8E78-E2585246EE66@gmail.com>
 <54F258AD.5040301@mailerd.de>
 <CAAXf6LXbRo40L9HZHZKcmHBqMz-KtOXvipQ1GrPd57DhUKzo3Q@mail.gmail.com>
 <CAGrucu3y+dK6ifA86fKfTDPCwqm9tOtv3vaW-NCgSMg-wu6wnQ@mail.gmail.com>
 <06D2305A-C43B-470D-A1C3-941D44CB367B@gmail.com>
Message-ID: <20150302093656.14272535@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 01 Mar 2015 22:52:41 +0100, Thomas De Schampheleire wrote:

> Thanks for clarifying, it makes more sense to me now. Keeping argparse but using the
>  dict-merging isn't too bad, it would address my main concern with the original
>  code (the not-so-beautiful handling of the arguments).
> 
> So Thomas P: it's your call now: I'm just as ok with going for the approach proposed
>  by Andr?.

I really don't know to be honest. Originally, I was really in favor of
keeping a solution that doesn't require external modules, but you
pushed docopt, and I ended up being OK with it. So if now you tell me
there is a reasonable solution without docopt, why not.

Who would do the rework? Andr?, are you willing to do it?

The thing is that there is still a number of very useful improvements
in the branch provided by Thomas DS. So in fact, I believe I might be
applying Thomas DS patches first, and then if someone wants to revert
back to argparse for argument parsing, a follow-up series should be
sent.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
