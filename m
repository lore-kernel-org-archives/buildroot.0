From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 11 May 2015 22:44:43 +0200
Subject: [Buildroot] [PATCH 0/3] Mono: fixing latest build failures
In-Reply-To: <87lhguj1hf.fsf@dell.be.48ers.dk>
References: <1431160889-3851-1-git-send-email-angelo.compagnucci@gmail.com>
 <87lhguj1hf.fsf@dell.be.48ers.dk>
Message-ID: <CA+TH9VnCUu0+C5Qeu=UX2_Qpd3dZ8qrZ4074Qkg1DkhQ045cjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

2015-05-11 22:36 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:
>
>  > This patch series should fix the latest build failures for mono.
>  > Fixes http://autobuild.buildroot.net/results/227/227f942107e4fcbc14bb1e7d97e1e2758d6f3f2d/
>
> It unfortunately doesn't sem to have fixed the issue :/
>
> http://autobuild.buildroot.net/results/81a/81aadff4232cf1f1c36d8effe309a87d706b858f/build-end.log

That's really unfortunate cause on my test machine everithing goes
well. I tested up to make -j32 and make without arguments, never
encountered that problem.

Could you suggest a better way to find the root cause of the bug?

Sincerely, Angelo

>
> --
> Bye, Peter Korsgaard



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
