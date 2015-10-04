From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 4 Oct 2015 12:12:01 +0200
Subject: [Buildroot] [PATCH v4 1/3] skeleton: Clean up profile file
In-Reply-To: <1443884002-13585-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443884002-13585-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <5610FB71.8040708@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime,

Maxime Hadjinlian wrote:
> There's a lot of code in /etc/profile, which doesn't really belong in a
> minimal default skeleton.
>
> Also, add an 'unset i' to avoid clutter.
>
> If the user has a specific needs, it needs to be added in
> /etc/profile.d/ by a post-build script.
>
> Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
[Build- and runtime-tested with qemu_arm_versatile_defconfig]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
