From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 5 Feb 2020 16:05:59 +0100
Subject: [Buildroot] ninja 1.10.0: build issue
In-Reply-To: <CAGm1_ktqUWDo8Wjq_QEXTxx17H9UkJS0hxY869X16Fka_wz8mQ@mail.gmail.com>
References: <CAGm1_ktqUWDo8Wjq_QEXTxx17H9UkJS0hxY869X16Fka_wz8mQ@mail.gmail.com>
Message-ID: <CAGm1_ktcB65mOnipJ=xbnKjBxjW8bWRNLvrxhHXZCycAepGCSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 5, 2020 at 12:47 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> I have a strange issue when building host-ninja. CMake complains about
> wrong OBJECT library usage. This upstream PR [1] fixes the issue for
> me.
>
> CMake was also complaining about the missing re2c tool.
>
> Am I the only one having these issues?
>
> [1] https://github.com/ninja-build/ninja/pull/1731

The ninja maintainer refused to take the patch.

On my Debian 10 system I have a host CMake 3.13.4 and it has no
problems with object libraries.

Yegor
