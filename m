From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 23:00:18 +0100
Subject: [Buildroot] [PATCH 1/2] sg3_utils: bump to version 1.40
In-Reply-To: <1416330318-5625-1-git-send-email-gustavo@zacarias.com.ar>
References: <1416330318-5625-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141118230018.27546527@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 18 Nov 2014 14:05:17 -0300, Gustavo Zacarias wrote:
> Also add hash file.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/sg3_utils/sg3_utils.hash |  2 ++
>  package/sg3_utils/sg3_utils.mk   | 10 +++++-----
>  2 files changed, 7 insertions(+), 5 deletions(-)
>  create mode 100644 package/sg3_utils/sg3_utils.hash

Applied to next, after doing a build test on ARM, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
