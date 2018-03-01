From: Christian Stewart <christian@paral.in>
Date: Thu, 01 Mar 2018 14:06:53 -0500
Subject: [Buildroot] [PATCH v2 0/9] upgrade docker-engine and associated
 components
In-Reply-To: <87371jirx0.fsf@dell.be.48ers.dk>
References: <20180301072012.25884-1-christian@paral.in>
 <87y3jchzk2.fsf@dell.be.48ers.dk> <874llzr8at.fsf@paral.in>
 <87371jirx0.fsf@dell.be.48ers.dk>
Message-ID: <87vaefpqcy.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Peter Korsgaard <peter@korsgaard.com> writes:
>>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
>  > 2018.03-rc1 will be released as a full release soon as 2018.02 was
>  > completely unusable due to a "container already exists" error when
>  > trying to start a container.
>
>  > If you would like me to make another series based around 17.12.1-ce that
>  > was just released, I would be happy to do so.
>
> Well, only if it actually works. But if you think there will be a new
> (working) stable release before our next release (E.G. by April) then
> I'm also fine with going with this 2018.03 version.

It's probably best to merge this to next for now (or wait until 2018.03
is released) and plan for the next stable release (2018.03) to include
in the next Buildroot stable.

I'll test the stability of the other release this weekend as well.

Best,
Christian
