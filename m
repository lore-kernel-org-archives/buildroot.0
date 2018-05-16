From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 16 May 2018 20:49:42 +0200
Subject: [Buildroot] [PATCH 1/1] rustc: enable on powerpc64le
 architecture
In-Reply-To: <abf9f60bdc49092eeebebd1be616cc29f6dd54e7.1526452144.git.sbobroff@linux.ibm.com>
References: <abf9f60bdc49092eeebebd1be616cc29f6dd54e7.1526452144.git.sbobroff@linux.ibm.com>
Message-ID: <20180516184942.GA23734@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 2018-05-16 16:29, Sam Bobroff wrote:
> Rust supports powerpc64le to the same level as powerpc64, so allow it.
>
> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> ---
> Hi Buildroot,
>
> I've tested this on a powerpc64le Power8 machine using the pre-built toolchain
> (it is available for this arch), and it works fine. Also, thanks to Eric Le
> Bihan for the inital work!

Tested OK with pre-built and full rustc variants using
qemu_ppc64le_pseries_defconfig.

Tested-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Acked-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Regards,

--
ELB
