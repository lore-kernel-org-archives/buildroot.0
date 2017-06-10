From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 10 Jun 2017 16:28:27 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-06-08
In-Reply-To: <20170609062926.BA8DA20E81@mail.free-electrons.com>
References: <20170609062926.BA8DA20E81@mail.free-electrons.com>
Message-ID: <CAMRc=MfRgo36k1wxZrR-Gy9oFhZEU4r_XE0uPdAVCEH6bebuBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-06-09 8:29 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2017-06-08, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Build failures related to your packages:
>
>          arm |            host-doxygen-1.8.13 | http://autobuild.buildroot.net/results/e131995a148835f1ad153e6077e4e483cda40387
>     mips64el |            host-doxygen-1.8.13 | http://autobuild.buildroot.net/results/e6f16da98a5f379445cdcbb77b47554267e244dd
>
> --
> http://autobuild.buildroot.net

These errors are strange. It seems like the script generating
output/build/host-doxygen-1.8.13/generated_src/lang_cfg.h sends its
stderr to the generated file so the compilation fails due to garbage
in the header. Unfortunately I'm travelling until the end of next week
so may not have time to look at it.

Best regards,
Bartosz Golaszewski
