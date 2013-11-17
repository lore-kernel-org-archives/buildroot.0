From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Nov 2013 22:51:26 +0100
Subject: [Buildroot] [squashfs] Fix typo in url
In-Reply-To: <1384639674-15170-1-git-send-email-arnaud.aujon@gmail.com>
References: <1384639674-15170-1-git-send-email-arnaud.aujon@gmail.com>
Message-ID: <20131117225126.66d916c0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnaud Aujon,

On Sat, 16 Nov 2013 23:07:54 +0100, Arnaud Aujon wrote:
> Fix a typo in squashfs site url
> 
> Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>

Just a quick comment: the title of the patch should have been:

squashfs: fix typo in url

or

package/squashfs: fix typo in url

You've used "[squashfs] fix typo in url" as the title, but this doesn't
work really nicely, because the part between [ and ] gets removed by
Git when applying the patch. Therefore, the title of your patch has
became only "fix typo in url", which isn't very descriptive.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
