From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 13 Mar 2016 05:34:48 +0300
Subject: [Buildroot] [PATCH] Revert "package/gcc: fix libgcc build for
	xtensa"
In-Reply-To: <20160312225709.GJ3745@free.fr>
References: <1457660040-13917-1-git-send-email-jcmvbkbc@gmail.com>
 <20160312225709.GJ3745@free.fr>
Message-ID: <CAMo8Bf+O2eA8f0Wbn+ysozwWmD_7qULRT3XJnxx+nO2KDkxN8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Mar 13, 2016 at 1:57 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Max, All,
>
> On 2016-03-11 04:34 +0300, Max Filippov spake thusly:
>> This reverts commit c44cf2cc97df1729577263d2b0cb5263e8cdc4c1.
>> Now that xtensa gas don't move literals into .init and .fini this fix is
>> no longer needed.
>
> Do you have an upstream reference with that fix?

It's 4111950f363221c4641dc2f33bea61cc94f34906 ,
https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=4111950f363221c4641dc2f33bea61cc94f34906
backported to all supported binutils as
  *-xtensa-fix-.init-.fini-literals-moving.patch

-- 
Thanks.
-- Max
