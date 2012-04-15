From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Apr 2012 14:04:35 +0200
Subject: [Buildroot] [PATCH] toolchain/gcc: add 4.7.x series
In-Reply-To: <1334321085-16458-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 13 Apr 2012 09:44:45 -0300")
References: <1334321085-16458-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878vhxb3qk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Add gcc 4.7.0 to the toolchain options.
 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  target/Config.in.arch                              |    1 +
 Gustavo>  .../gcc/0001-toolchain-gcc-add-4.7.x-series.txt    |  659 ++++++++++++++++++++

It looks like that file shouldn't have been included, so I removed
it. Committed, thanks.

-- 
Bye, Peter Korsgaard
