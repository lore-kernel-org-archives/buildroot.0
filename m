From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 16:35:25 +0100
Subject: [Buildroot] [PATCH 1/2] Add python patch to make ossaudiodev
 module building optional
In-Reply-To: <1420714168-4994-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1420714168-4994-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20150110163525.163a349d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zoltan Gyarmati,

On Thu,  8 Jan 2015 11:49:27 +0100, Zoltan Gyarmati wrote:
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
>  package/python/115-optional-ossaudiodev.patch | 30 +++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/python/115-optional-ossaudiodev.patch

Thanks, both patches applied. I've also added one patch to make
ossaudiodev optional for the target Python, and done the same work for
Python 3.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
