From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Dec 2018 17:04:19 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-12-18
In-Reply-To: <20181219070026.D137620AA3@mail.bootlin.com>
References: <20181219070026.D137620AA3@mail.bootlin.com>
Message-ID: <CAMRc=MfsgFfmS_V_p8k-FbP6GtXTbBiVDDjv0N-6pm0kJ21NOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?r., 19 gru 2018 o 08:00 Thomas Petazzoni
<thomas.petazzoni@bootlin.com> napisa?(a):
>
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2018-12-18, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Results for the '2018.02.x' branch
> ==================================
>
> Build failures related to your packages:
>
>          arm |                pulseview-0.4.0 | http://autobuild.buildroot.net/results/e32164284d79b4bb814a962907a35fc45bcbb89c
>
> --
> http://autobuild.buildroot.net

I can reproduce this alright but I'm not sure what this C++ build
error means. Why are we even building tests in the first place?

Bernd: I see you added this switch to the package - can you take a
look at this failure?

Bart
