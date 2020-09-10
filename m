From: Christian Stewart <christian@paral.in>
Date: Thu, 10 Sep 2020 15:30:04 -0700
Subject: [Buildroot] More maintainers
In-Reply-To: <20200907172052.50b4f148@windsurf.home>
References: <CAFSsvmpLGd-2pequ_skL+8d_txyhxt5q5tgo0SDAfifVLJY6cg@mail.gmail.com>
 <87o8mlmoga.fsf@dell.be.48ers.dk>
 <CA+TH9VkA2ETrCvQF+mhb=PeKm8P=o2Jnesmooh4KCKSbzUcANQ@mail.gmail.com>
 <87blilmeo2.fsf@dell.be.48ers.dk>
 <CA+h8R2qYVjSwFZR0DcOpAdSY8nZKURLwW+a8tanxpEvDh__fSg@mail.gmail.com>
 <877dt8n2o7.fsf@dell.be.48ers.dk>
 <CAFSsvmqdBURoCVmbFRBUoYwd3VErpOp1GcG=xzxJETpbpAVrTg@mail.gmail.com>
 <20200905211650.0a229191@windsurf.home>
 <CA+TH9Vn8cdHTKmoT1LLY7F=ywtuH_bSLFxZX1aQZgH6yFT26TA@mail.gmail.com>
 <20200905223835.1e68d658@windsurf.home>
 <CA+TH9VkgkuMUUy65L6njfjSuDeJ7wzXueJmX74XF9YQucd8RnA@mail.gmail.com>
 <20200905230431.34bcd9ea@windsurf.home>
 <CA+TH9Vn8aOXTCG-KeVNZ+=pJCEz5UXBhOtSqyf+uf8uts8hrsQ@mail.gmail.com>
 <CAFSsvmq4UWvSAhpmJCPt35PagXaZMuHVJenMd8d4oZd7E3KPDA@mail.gmail.com>
 <87imcric55.fsf@dell.be.48ers.dk>
 <CAGm1_ktS7BTH0wJnVqu0naPjdw0+Yzd+gD-evhBH2dFT2T97xQ@mail.gmail.com>
 <CAEyMn7b0mjx+Vee9vtr2CzvYDYBgA5Spo3-paH_1pKGENczaHg@mail.gmail.com>
 <20200907172052.50b4f148@windsurf.home>
Message-ID: <CA+h8R2rATYdzbT9ybjibNkdyeL1vYtt85V_V6hEX4YOA7hmj4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Thank you all for your time on the phone discussion today. I really
appreciated hearing everyone's viewpoints.

My goal here is /not/ to fragment the project, but rather find a way
to allow everyone's desired workflows to come together.

In terms of the social issue with getting more quality Reviewed-by,
that is not something I know any solution to.

As for tooling;

I don't see any incompatibility between emails and GitLab - if we have
a bot that formats the discussion on GitLab into the exact same format
we expect in emails, and vise-versa.

Is there really a direct issue with having the same information in two places?

So: to be most useful, this is what I will try to start work on this
week towards this topic:

 - Bot prototype for syncing between emails and GitLab PRs
 - Automated CI w/ Buildroot in Initramfs against "real hardware"
(odroid, pi, intel mostly)
 - Contributing more GitLab runners for the CI using spare compute resources.
 - Automated PR + test (and then my own manual review) of the patch backlog.


On Mon, Sep 7, 2020 at 8:21 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 7 Sep 2020 17:02:20 +0200
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > regarding to this discussion I also have two infos I would like to
> > share with you:
> >
> > [1] "As GitLab has grown over the years, we?re incredibly humbled by
> > the number of users who choose to use our free platform. As the
> > adoption of our free product has scaled, so have the underlying costs
> > to support it. As we are committed to continue to support the free
> > product for the larger community, we need to implement further CI/CD
> > limits on GitLab.com. This change is only applicable to free
> > GitLab.com users?current GitLab.com paid tiers and all self-managed
> > GitLab tiers will remain unchanged."
> >
> > Does the buildroot gitlab is affected by this change? Or is buildroot
> > a member of the GitLab for Open Source program [2]?
>
> For gitlab.com/buildroot/buildroot, we are using our own Gitlab CI
> runners, and not the free runners, so my understanding is that we are
> not affected by this change.

Would be interested to hear what everyone thinks of the concept of
keeping both e-mail and GitLab together.

Best regards,
Christian Stewart
