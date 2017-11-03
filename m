From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 22:01:25 +0100
Subject: [Buildroot] [PATCH] package/python-toml: bump to version 0.9.3
In-Reply-To: <20171103004757.20717-1-andrew.smirnov@gmail.com>
References: <20171103004757.20717-1-andrew.smirnov@gmail.com>
Message-ID: <20171103220125.0301f1b0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Nov 2017 17:47:57 -0700, Andrey Smirnov wrote:
> Bump package to version 0.9.3 and change _SETUP_TYPE to
> 'setuptools', since its setup.py now uses 'setuptools' by default and
> switches to 'distutils' only as a fallback[1]
> 
> [1] https://github.com/uiri/toml/blob/0.9.3/setup.py#L2
> 
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  package/python-toml/python-toml.hash | 2 +-
>  package/python-toml/python-toml.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
