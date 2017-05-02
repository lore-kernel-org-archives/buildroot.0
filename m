From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 1 May 2017 20:43:27 -0500
Subject: [Buildroot] [PATCH] package/protobuf: depend on gcc >= 4.5
In-Reply-To: <CAKKQwLQz=10qxvcFL6xgmKMTwXGbKmbt74xJHD8O9C6_7SakYA@mail.gmail.com>
References: <20170426162850.5214-1-mrugiero@gmail.com>
 <20170429143136.3da63d52@free-electrons.com>
 <CAKKQwLR3sxMycDpH0_qvva7_-9s5DCZzs5kj-xJe4_7YJOZ59Q@mail.gmail.com>
 <CAKKQwLRyHdGAqK8QtPuOexXp+nokJ+7wgAbwvRE6b9fkg25jKQ@mail.gmail.com>
 <20170430092950.3e39e809@free-electrons.com>
 <CAKKQwLQz=10qxvcFL6xgmKMTwXGbKmbt74xJHD8O9C6_7SakYA@mail.gmail.com>
Message-ID: <CANQCQpbRkM0vcMM7hJv0tbBCD+mPZwyN=fXAq4_uNQ96jnbK=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sun, Apr 30, 2017 at 11:57 PM, Mario Rugiero <mrugiero@gmail.com> wrote:
>
> 2017-04-30 4:29 GMT-03:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
> > Hello,
> >
> Hi
> > On Sat, 29 Apr 2017 17:02:26 -0300, Mario Rugiero wrote:
> >
> > Then we also have a problem with the host variant: host-protobuf also
> > requires gcc >= 4.5.0. I've restarted my autobuilder, and it uses an
> > old version of gcc on the host, which causes host-protobuf to fail
> > building:
> I'll give it a shot at reproducing locally. Hopefully I can patch the
> triggering instances.
> If I succeed, I'll commit a different patch to support building on
> older versions of gcc,
> and will send it upstream, too, so the patches can be dropped in a
> following version.
> Wish me luck!


Another data point,  This Ubuntu host GCC seems to not have the issue,
so some distros have pulled the fix in.
g++ (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4


Matt
