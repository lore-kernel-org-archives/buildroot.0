From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 3 Apr 2018 14:05:47 -0700
Subject: [Buildroot] [PATCH 1/1] package/systemd: add upstream build fix
 #8456
In-Reply-To: <20180403061138.17286-1-chemobejk@gmail.com>
References: <20180403061138.17286-1-chemobejk@gmail.com>
Message-ID: <CAMWSM7iqFy9OFSqeCOwKX1JSaQT2YWGY7SidmYoJCvpRtZ1JBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

On Mon, Apr 2, 2018 at 11:11 PM, Stefan Becker <chemobejk@gmail.com> wrote:
> Signed-off-by: Stefan Becker <chemobejk@gmail.com>

Tested-by: Joseph Kogut <joseph.kogut@gmail.com>

Tested on x86_64 w/ GCC 6.4 and Glibc 2.26, as well as GCC 7.3.0 and
Glibc 2.27. The build fails on both without the patch, and succeeds on
both with the patch.

Thanks,
Joseph
