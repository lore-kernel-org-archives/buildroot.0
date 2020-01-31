From: Matthew Weber <matthew.weber@collins.com>
Date: Fri, 31 Jan 2020 11:17:01 -0600
Subject: [Buildroot] [PATCH] package/bash: update to version 5.0.11
In-Reply-To: <HE1PR07MB3401D1CE88E787C1171A636B9D070@HE1PR07MB3401.eurprd07.prod.outlook.com>
References: <20200107102421.11432-1-p.debruijn@unilogic.nl>
 <CANQCQpYbJ1bDcSXyi1GFzNvUjDdLYjBZs9FeCScfMhGhnu+4Gg@mail.gmail.com>
 <HE1PR07MB3401D1CE88E787C1171A636B9D070@HE1PR07MB3401.eurprd07.prod.outlook.com>
Message-ID: <CANQCQpZQWCVQE-YvtC3SmzNJS5bk7HWJk3L1pP9pfuk7rEzAXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pascal,

On Fri, Jan 31, 2020 at 4:41 AM Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:
>
> Matthew,
>
> Apparently this issue is reproducable in the br-powerpc-603e-basic-cpp target of utils/test-pkg
>
> I did notice this target uses uclibc, are you using uclibc as well? If so, it might be interesting to see if musl/glibc would result in a successful bash build...

Currently seeing it with glibc.  I'll work on a minimal config now and
reply when it's done.
