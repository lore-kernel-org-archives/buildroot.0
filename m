From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 13:09:46 +0100
Subject: [Buildroot] [PATCH 3/3] qemu: fix project's URL
In-Reply-To: <1450353428-57815-3-git-send-email-Vincent.Riera@imgtec.com>
References: <1450353428-57815-1-git-send-email-Vincent.Riera@imgtec.com>
 <1450353428-57815-3-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151217130946.4748c491@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 17 Dec 2015 11:57:08 +0000, Vicente Olivert Riera wrote:
> http://qemu.org and http://www.qemu.org redirects to
> http://wiki.qemu.org/Main_Page, so let's use this one instead.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

I disagree, qemu.org remains the main official address. The fact that
it redirects to some other page on a Wiki currently is just an
"implementation detail", which the Qemu guys may change in the future.
We should continue to use qemu.org.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
