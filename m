From: Mario Rugiero <mrugiero@gmail.com>
Date: Mon, 1 May 2017 01:57:11 -0300
Subject: [Buildroot] [PATCH] package/protobuf: depend on gcc >= 4.5
In-Reply-To: <20170430092950.3e39e809@free-electrons.com>
References: <20170426162850.5214-1-mrugiero@gmail.com>
 <20170429143136.3da63d52@free-electrons.com>
 <CAKKQwLR3sxMycDpH0_qvva7_-9s5DCZzs5kj-xJe4_7YJOZ59Q@mail.gmail.com>
 <CAKKQwLRyHdGAqK8QtPuOexXp+nokJ+7wgAbwvRE6b9fkg25jKQ@mail.gmail.com>
 <20170430092950.3e39e809@free-electrons.com>
Message-ID: <CAKKQwLQz=10qxvcFL6xgmKMTwXGbKmbt74xJHD8O9C6_7SakYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-04-30 4:29 GMT-03:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
Hi
> On Sat, 29 Apr 2017 17:02:26 -0300, Mario Rugiero wrote:
>
> Then we also have a problem with the host variant: host-protobuf also
> requires gcc >= 4.5.0. I've restarted my autobuilder, and it uses an
> old version of gcc on the host, which causes host-protobuf to fail
> building:
I'll give it a shot at reproducing locally. Hopefully I can patch the
triggering instances.
If I succeed, I'll commit a different patch to support building on
older versions of gcc,
and will send it upstream, too, so the patches can be dropped in a
following version.
Wish me luck!
>
>   http://autobuild.buildroot.net/results/539/53908fe11b5b6497205e17c151f02e94fab10999/build-end.log
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

Regards,
Mario.
