From: Rob Landley <rob@landley.net>
Date: Thu, 9 Apr 2015 01:52:08 -0500
Subject: [Buildroot] [PATCH v2] sh4: fix toolchain creation
In-Reply-To: <20150407201124.GA11866@waldemar-brodkorb.de>
References: <20150407201124.GA11866@waldemar-brodkorb.de>
Message-ID: <CAOS_Y6Q36OJXbtTp=dCtYjWNo2WBsqiPw4AGX7GPzQy7GTqz7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 7, 2015 at 3:11 PM, Waldemar Brodkorb <wbx@openadk.org> wrote:
> The Linux kernel does force compile with -m4-nofpu, which is only
> available when building a multilib toolchain.
...
> CAUTION: uClibc/uClibc-ng does not work for sh4a/sh4aeb.

Does musl work with that? (The uClibc project is moribund verging on
dead, musl is the obvious replacement. I'm trying to get sh2 support
working in musl but there are toolchain issues I need to deal with
first...)

Rob
