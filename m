From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 26 Feb 2015 15:24:36 +0100
Subject: [Buildroot] How do patches get committed?
In-Reply-To: <54EF1E6B.8060100@nrc-cnrc.gc.ca>
References: <54EF1E6B.8060100@nrc-cnrc.gc.ca>
Message-ID: <CAHXCMMLaQA9RTWxPv3mRmCd5E2oArRVakcnExajxLYFrm1mi8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Thu, Feb 26, 2015 at 2:23 PM, Matthew Bastian
<Matthew.Bastian@nrc-cnrc.gc.ca> wrote:
> This week I submitted some patches for RTAI realtime. I presume that just
> because I submitted them that they are not automatically incorporated into
> the latest release.

Here is a few answers [1,2] how the Buildroot project works and
patches get applied.

Don't worry, your patches are not lost. ;-) Just give some time to
reviewers/testers/maintainers to process the patch backlog [3]. As you
can see, there is a bit more than 300 patches in the pipes, and we
tend to process them in a fifo way. ;-)

Anyway, helping the community to process patches is very much
appreciated :-) You can find how to help here [4].

[1] http://lists.busybox.net/pipermail/buildroot/2013-February/066902.html
[2] http://lists.busybox.net/pipermail/buildroot/2013-February/066927.html
[3] http://patchwork.ozlabs.org/project/buildroot/list/
[4] http://nightly.buildroot.org/#_contributing_to_buildroot
>
> So who vets these and how can I make sure my patches get incorporated?
>
> Matt
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
