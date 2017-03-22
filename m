From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 22 Mar 2017 09:30:24 +0100
Subject: [Buildroot] [PATCH v3 0/5] Runtime testing infrastructure
In-Reply-To: <1490042214-6762-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490042214-6762-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LVB3jjNsg-vj-pUjnnaFJC3xs2w_CqYUfHJaOj2Wg8y7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 20, 2017 at 9:36 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Here is a third version of a small runtime testing infrastructure for
> Buildroot.
>
> I have not tried to take into account all suggestions from the review,
> only the ones that really must be fixed before it gets applied. I'd
> like this stuff to be applied so that more people can start working on
> the testing infrastructure and submit patches.
>
> The first patch introduces the infrastructure itself, the other 4
> patches just add a small number of test cases.
>
> By far and large the most featureful set of tests are the filesystem
> tests, testing a lot of features of our filesystem image support.
>
> There are definitely lots of possible improvements to the
> infrastructure, and lots of possible tests to add, but we need to get
> started at some point, and that's an initial proposal.
>

I gave some minor comments/suggestions, but nothing blocking. I fully
agree to not hold on to this much longer...

Well done!

/Thomas
