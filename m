From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 14 Jan 2018 21:53:53 -0200
Subject: [Buildroot] [PATCH 02/17] tests: add test for post-fakeroot
 script
References: <878bd9ac6569877450e28861cb047a93c1550eb9.1515939400.git.yann.morin.1998@free.fr>
Message-ID: <5a5bed91131a0_29103fc7069d9bb4990d1@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Jan 14, 2018 at 12:16 PM, Yann E. MORIN wrote:

> Currently, only post-build and post-image scripts were tested, each with
> their own test-script.
> 
> The two test-scripts only differ in the name of the log file they
> create, and it is based on the name of the script, so it is easy to
> share the script.
> 
> This allows us to easily re-use it for testing post-fakeroot scripts.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[with only the 2 first patches from the series applied
 https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/47907854]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Regards,
Ricardo
