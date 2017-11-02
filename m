From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 2 Nov 2017 09:42:06 +0100
Subject: [Buildroot] [PATCH] uclibc: convert accept4 to use cancel.h
 macros
In-Reply-To: <20171102070046.GA6819@waldemar-brodkorb.de>
References: <20171102070046.GA6819@waldemar-brodkorb.de>
Message-ID: <CAHXCMML8RD=W5vrcQ67xuVHg17z9Djqpg1s25WPuLg0x2iAkoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 2, 2017 at 8:00 AM, Waldemar Brodkorb <wbx@openadk.org> wrote:
> Fixes:
>  http://autobuild.buildroot.net/results/78e033fe9f43845581a5d87b21a8451f67520e44
>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Tested-by: Samuel Martin <s.martin49@gmail.com>
