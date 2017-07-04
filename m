From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Jul 2017 11:10:02 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-07-02
In-Reply-To: <20170703063103.B69DB21E07@mail.free-electrons.com>
References: <20170703063103.B69DB21E07@mail.free-electrons.com>
Message-ID: <CAMRc=MfAxe99whmHQuBmBiWB7=mMjZEsZ6igT9XcsoQ9kXrkwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-07-03 8:31 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2017-07-02, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Build failures related to your packages:
>
>          arm |                   libzip-1.2.0 | http://autobuild.buildroot.net/results/c50ffa5bf565e75333192edc89e2d39044d07f26
>          arm |                   libzip-1.2.0 | http://autobuild.buildroot.net/results/24d5d9a55a98bcf7c4c057732fad5e6b9cd7e1cb
>

Hi Thomas,

these failures are caused by missing the dynamic loader functionality
in this pre-built toolchain. Should we maybe have a new config option
like BR2_TOOLCHAIN_HAS_DL or something similar and depend on it from
packages that need it?

Best regards,
Bartosz Golaszewski
