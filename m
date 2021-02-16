From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 16 Feb 2021 15:06:39 +0100
Subject: [Buildroot] [PATCH 1/1] support/scripts/size-stats: increase
 number of files that can be linked to a source
In-Reply-To: <20210210110518.24817-1-daniel.crowe@resolution.systems>
References: <20210210110518.24817-1-daniel.crowe@resolution.systems>
Message-ID: <CAAXf6LXXEV3PZ1rQ58nJhR7g-Jgra71wtkWmbo8t9ihAruum9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Daniel,

El mi?, 10 feb 2021 a las 12:13, Daniel Crowe
(<daniel.crowe@resolution.systems>) escribi?:
>
> Signed-off-by: Daniel Crowe <daniel.crowe@resolution.systems>
> ---
>  Makefile                   |  1 +
>  support/scripts/size-stats | 76 +++++++++++++++++++++++++++-----------
>  2 files changed, 56 insertions(+), 21 deletions(-)
>

Please extend your commit message with more information: what is the
problem you're fixing, and how are you fixing it.
Right now, we can only guess what it is doing based on the code.

It looks like the change is extending the size information to
rootfs-overlays, while today only real packages are considered.
But if that is correct, then the title "increase number of files that
can be linked to a source" is confusing to me.

Thanks,
Thomas
