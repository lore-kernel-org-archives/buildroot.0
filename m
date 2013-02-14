From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Feb 2013 14:47:13 +0100
Subject: [Buildroot] [PATCH 2/2] libcurl: packages that use it need mmu
 also
In-Reply-To: <1360846981-26122-2-git-send-email-gustavo@zacarias.com.ar>
References: <1360846981-26122-1-git-send-email-gustavo@zacarias.com.ar>
 <1360846981-26122-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130214144713.632dcc63@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 14 Feb 2013 10:03:01 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/b812b8931a7291ea8969c9818aea1044ee302c20
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

I don't agree. I believe the libcurl package should not depend on
BR2_USE_MMU instead. I have a patch that I'll send as a reply to this
e-mail.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
