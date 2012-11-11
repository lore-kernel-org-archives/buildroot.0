From: Simon Dawson <spdawson@gmail.com>
Date: Sun, 11 Nov 2012 10:04:08 +0000
Subject: [Buildroot] [PATCH 1/2 v2] neard: new package
In-Reply-To: <20121111051107.GA20951@sapphire.tkos.co.il>
References: <1352469107-25993-1-git-send-email-spdawson@gmail.com>
 <20121111051107.GA20951@sapphire.tkos.co.il>
Message-ID: <CAHt8ZCOZ_cRYB=zUg0FXVRhxeVTAYGDBEtmYRMo3k7eazHc1FQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch; thanks for the feedback.

On 11 November 2012 05:11, Baruch Siach <baruch@tkos.co.il> wrote:
>> +NEARD_VERSION = 0.7
>
> Version 0.8 seems to be available. Any reason not to use that one?

No reason --- I just hadn't spotted that 0.8 had been released.

>> +NEARD_INSTALL_STAGING = YES
>
> Why is this needed? Does this package export headers needed by others?

In fact, this is not needed. I had thought that the neardal package
depended on headers installed by neard, but this is not the case.

I'll rework the neard and neardal patches, and resubmit.

Simon.
