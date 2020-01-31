From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Fri, 31 Jan 2020 10:41:15 +0000
Subject: [Buildroot] [PATCH] package/bash: update to version 5.0.11
In-Reply-To: <CANQCQpYbJ1bDcSXyi1GFzNvUjDdLYjBZs9FeCScfMhGhnu+4Gg@mail.gmail.com>
References: <20200107102421.11432-1-p.debruijn@unilogic.nl>,
 <CANQCQpYbJ1bDcSXyi1GFzNvUjDdLYjBZs9FeCScfMhGhnu+4Gg@mail.gmail.com>
Message-ID: <HE1PR07MB3401D1CE88E787C1171A636B9D070@HE1PR07MB3401.eurprd07.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew,

Apparently this issue is reproducable in the br-powerpc-603e-basic-cpp target of utils/test-pkg

I did notice this target uses uclibc, are you using uclibc as well? If so, it might be interesting to see if musl/glibc would result in a successful bash build...

Regards,
Pascal de Bruijn
Unilogic B.V.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200131/c77cf463/attachment.html>
