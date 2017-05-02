From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 14:03:31 +0200
Subject: [Buildroot] [PATCH] package/protobuf: depend on gcc >= 4.5
In-Reply-To: <CANQCQpbRkM0vcMM7hJv0tbBCD+mPZwyN=fXAq4_uNQ96jnbK=A@mail.gmail.com>
References: <20170426162850.5214-1-mrugiero@gmail.com>
 <20170429143136.3da63d52@free-electrons.com>
 <CAKKQwLR3sxMycDpH0_qvva7_-9s5DCZzs5kj-xJe4_7YJOZ59Q@mail.gmail.com>
 <CAKKQwLRyHdGAqK8QtPuOexXp+nokJ+7wgAbwvRE6b9fkg25jKQ@mail.gmail.com>
 <20170430092950.3e39e809@free-electrons.com>
 <CAKKQwLQz=10qxvcFL6xgmKMTwXGbKmbt74xJHD8O9C6_7SakYA@mail.gmail.com>
 <CANQCQpbRkM0vcMM7hJv0tbBCD+mPZwyN=fXAq4_uNQ96jnbK=A@mail.gmail.com>
Message-ID: <20170502140331.0b4a7cbf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 1 May 2017 20:43:27 -0500, Matthew Weber wrote:

> > I'll give it a shot at reproducing locally. Hopefully I can patch the
> > triggering instances.
> > If I succeed, I'll commit a different patch to support building on
> > older versions of gcc,
> > and will send it upstream, too, so the patches can be dropped in a
> > following version.
> > Wish me luck!  
> 
> Another data point,  This Ubuntu host GCC seems to not have the issue,
> so some distros have pulled the fix in.
> g++ (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4

Well, the problem has been fixed in gcc upstream since 4.5 apparently,
so obviously a 4.8 gcc does not exhibit the issue, and it's not because
of distro-specific patches.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
