From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 13 Jul 2015 18:29:14 -0400
Subject: [Buildroot] [PATCH 3/4] skeleton: New package
In-Reply-To: <1436821211-4446-3-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436821211-4446-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1436821211-4446-3-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <CANxTyt7rFzfnL-vh1ReehxYeUR67-KVWojzGM+HAM_+mRMnd-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime,

On Mon, Jul 13, 2015 at 5:00 PM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> This package moves everything from /system/skeleton into a proper
> package.
>
> The entry Makefile is modified to remove the skeleton support.
>
> The generic, autotools and cmake infra are modified to filter skeleton
> and host-skeleton. Also, in the pkg-generic we add skeleton as a
> dependency to every package.
>
> All the TARGET_FINALIZE_HOOKS that were done in system/system.mk are now
> done in skeleton.
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Is there perhaps some benefit to not moving the default skeleton, to
keep it near the default device_table files that cooperate with it?
You can still have a skeleton package, and rsync from system ...

Just a thought,

Danomi -
