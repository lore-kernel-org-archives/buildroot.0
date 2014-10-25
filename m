From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 10:50:55 +0200
Subject: [Buildroot] [PATCH v6 0/2] Mono new package
In-Reply-To: <1414009330-4433-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1414009330-4433-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20141025105055.05c53953@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Wed, 22 Oct 2014 22:22:08 +0200, Angelo Compagnucci wrote:

> Angelo Compagnucci (2):
>   package/monolite: new package
>   package/mono: new package

Thanks, both patches applied. On the second patch, there was a missing
dependency of host-mono on host-gettext (which you didn't see probably
because you have gettext installed on your machine). I also did some
improvements to the licensing description, even though some independent
review of this (Yann, Luca ?) would be good.

Thanks for getting through the review process for those not-so-trivial
packages!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
