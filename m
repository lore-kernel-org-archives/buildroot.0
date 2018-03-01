From: Christian Stewart <christian@paral.in>
Date: Thu, 01 Mar 2018 12:54:02 -0500
Subject: [Buildroot] [PATCH v2 0/9] upgrade docker-engine and associated
 components
In-Reply-To: <87y3jchzk2.fsf@dell.be.48ers.dk>
References: <20180301072012.25884-1-christian@paral.in>
 <87y3jchzk2.fsf@dell.be.48ers.dk>
Message-ID: <874llzr8at.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Peter Korsgaard <peter@korsgaard.com> writes:
>  >  - runc to 9f9c96235cc97674e935002fc3d78361b696a69e
>  >  - docker-containerd to v1.0.2
>  >  - docker-engine to v2018.03.0-ce-rc1

>
> I am far from a docker expert, but isn't this an 'edge' release? Given
> the Buildroot release schedule, wouldn't it make more sense to use the
> 'stable' releases with a similar quarterly support/release schedule?

Yes, it's intended to be merged into "next" for release not in Buildroot
2018.02 but later. I thought I had mentioned that in the cover letter,
but I guess that was in another revision, lost somewhere months ago.

The reason is because from our testing on various devices with varying
container workloads, the only two stable versions (with no critical
bugs) of Docker that we have been able to find were early 2017 or 2018.03-rc1.

2018.03-rc1 will be released as a full release soon as 2018.02 was
completely unusable due to a "container already exists" error when
trying to start a container.

If you would like me to make another series based around 17.12.1-ce that
was just released, I would be happy to do so.

Best,
Christian Stewart
