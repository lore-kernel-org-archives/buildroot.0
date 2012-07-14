From: Simon Dawson <spdawson@gmail.com>
Date: Sat, 14 Jul 2012 10:07:06 +0100
Subject: [Buildroot] [PATCH] protobuf: fix circular dependency warning
In-Reply-To: <20120713225952.67925f4e@skate>
References: <1342212552-6567-1-git-send-email-spdawson@gmail.com>
 <20120713225952.67925f4e@skate>
Message-ID: <CAHt8ZCMqmpRRva26M9XpC-NYUHyEyf9mE33yMHSrqtJEYNm6wA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13 July 2012 21:59, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> I think
> http://lists.busybox.net/pipermail/buildroot/2012-July/055442.html
> solves that problem in a much more generic way. Could you test this
> patch and report if it solves the problem for you?

Hi Thomas. This generic mechanism does indeed work in the present case
(package protobuf). However, the indicated patch is only for the
gentargets package mechanism; to apply to the protobuf package, a
similar modification of pkg-autotargets.mk is required.

I'm happy to do this modification, if you think it appropriate.

Simon.
