From: Steve deRosier <derosier@gmail.com>
Date: Wed, 4 May 2016 13:25:52 -0700
Subject: [Buildroot] [PATCH v2 1/1] flatcc: new package
In-Reply-To: <bbbedfcc-6c2f-4441-95ad-543ea1c53fef@mind.be>
References: <1462145376-1377-1-git-send-email-steve.derosier@lairdtech.com>
 <CAHXCMM+wVwqthUOEh+e3fHDA_=J0FS6FqG2cBF+zhVM0BGVoFQ@mail.gmail.com>
 <CALupW3BnsWbBFZhd+GQe26rtXsg-KZUsxkxupZ_5J88Yb14PeA@mail.gmail.com>
 <c0a641fc-b5ce-7c69-14f1-1b53f0af7623@mind.be>
 <CALupW3B76bWmAnLSLAizMgZBGwig5Gm6o3dG9q5ydtEaSyqqpw@mail.gmail.com>
 <bbbedfcc-6c2f-4441-95ad-543ea1c53fef@mind.be>
Message-ID: <CALupW3C+oU9maQSa_FC1bRA=Wt83e=mDpk0NFe1atBKO5WmW6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 4, 2016 at 10:02 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 05/04/16 18:12, Steve deRosier wrote:
>> @Samuel and @Arnout, does that plan sound OK? Can we move forward with
>> this?  Or are there other things that I need to address?
>
>
>  Hm, tricky...
>
>  On the one hand, I don't want to block your submission over this issue.
>
>  On the other hand, we don't want to carry a feature patch that may never be
> accepted upstream.
>
>  Since the patch wasn't OK yet as it was (it should look at the global
> BUILD_SHARED_LIBS), isn't it easier to just drop that patch, and revert the
> installation commands to your original version, adding a comment that in the
> SHARED_STATIC case only shared libs are built anyway? Or is that too
> frustrating because you did redundant work?
>
>  I can understand that it's frustrating. Actually, reading back what I wrote
> yesterday, I'm afraid that I may have made it worse by making you feel it
> was your own fault. But that's not at all the case: I haven't been
> sufficiently clear in my original review, and you can't magically know all
> the constraints that we try to satisfy.
>
>  That said, a bit of frustration is going to be unavoidable here... I'm
> sorry we haven't been a better upstream for you. And to make it worse, it
> looks like your first submission has been even more unappreciated...
>

Frustrating, sure, a bit. It's the things you think are going to be
easy and straightforward that always seem to the most frustrating. But
hey, I've upstreamed to the kernel and other things in the past, so I
know these things happen and I'll get over it. That's why we
communicate about these things. ;)

How about this: I'll work with Mikkel a bit and see what we can do
upstream in flatcc to make it a bit more buildroot compatible so I
don't have to do heroic measures to make it work. Then I'll resubmit
for v0.3.4 or .5 and get it in. For now I'll just have to live with my
version in my buildroot fork so we can get our work done on v0.3.3.

So, please don't merge v2 of this patch. I'll try again in a few weeks.

- Steve
