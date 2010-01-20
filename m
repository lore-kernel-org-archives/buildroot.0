From: Anders Darander <anders.darander@gmail.com>
Date: Wed, 20 Jan 2010 10:07:40 +0100
Subject: [Buildroot] glibc support
In-Reply-To: <8128F0FD6C26E14C8EB4BFDB92B8D6B2134AE1@2putt.int.lantronix.com>
References: <8128F0FD6C26E14C8EB4BFDB92B8D6B2134AE1@2putt.int.lantronix.com>
Message-ID: <2c9a759f1001200107g36629fdcicbaaa824fba9a6da@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

On Tue, Jan 19, 2010 at 23:29, Matthew Davison
<matt.davison@lantronix.com> wrote:
> Is building with glibc instead of uClibc currently supported in buildroot?
> If so, what steps are required?

I've done this in a few projects. What I did (and I suppose everyone
else) is to build the cross-toolchain and glibc using crosstool-NG.
Then this toolchain can be used as an external toolchain in buildroot,
together with the glibc that you build. It is mostly pretty
straightforward.

Regards,
Anders
