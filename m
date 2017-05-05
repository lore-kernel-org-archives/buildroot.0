From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 May 2017 20:20:49 +0200
Subject: [Buildroot] [PATCH v2] package: protobuf,
 python-protobuf: bump to v3.3.0
In-Reply-To: <CAKKQwLQWLytghCPeEWWjMsLw2vrcL-DumzWcevz2Dz+uwE0HGQ@mail.gmail.com>
References: <20170503205945.7065-1-mrugiero@gmail.com>
 <20170504145610.39ba9d06@free-electrons.com>
 <CAKKQwLSKh5LijFRDNDXmocqgxtgSk1Gt_8vh8wnFDbCPbtdZJg@mail.gmail.com>
 <CAKKQwLQWLytghCPeEWWjMsLw2vrcL-DumzWcevz2Dz+uwE0HGQ@mail.gmail.com>
Message-ID: <20170505202049.643d7041@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 5 May 2017 14:24:00 -0300, Mario Rugiero wrote:

> I fixed that particular issue in my local copy, but fails because
> Atomic32 is not supported in that toolchain.
> Do you know if there is any similar toolchain with such support?
> Otherwise, how should I fix that?

What error do you have exactly?

Something like an undefined reference to some __atomic_*() function? If
so, then make sure you link with -latomic.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
