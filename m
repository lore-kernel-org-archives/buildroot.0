From: Stas Sergeev <stsp2@yandex.ru>
Date: Tue, 3 Sep 2019 13:00:20 +0300
Subject: [Buildroot] clang tool-chain support?
Message-ID: <87d78eb1-45aa-6200-03fe-20998152fd1a@yandex.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

Just a few toolchain-related questions from
novice buildroot user.

- Currently it seems buildroot does not support
the clang toolchain natively, so is there any way
(preferably a documented one) to use the host's
clang tool-chain? (I've only found the way to build
clang as a target package, which is not what I need)

- I know that currently there are not too many
clang-only projects, but I just want to build a few
of them. As their amount may only increase
in the future, are there any plans to get the
native clang support in buildroot?
(not found in buildroot's TODO list)

- buildroot seems to provide yasm instead of nasm.
While I was able to work around yasm bugs and
build the project with it, I wonder why such a choice?
Unless I am mistaken, nasm is active and yasm is
pretty much dead - I've got that impression from
reporting bugs to both projects and getting replies
(and instant fixes) only from nasm.
So any plans to switch to nasm?
