From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jul 2015 09:11:25 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-06-29
In-Reply-To: <559AD809.4050305@free-electrons.com>
References: <20150630063014.44429100A75@stock.ovh.net>
 <20150630140738.526d72b8@free-electrons.com>
 <559AD809.4050305@free-electrons.com>
Message-ID: <20150707091125.57603686@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 06 Jul 2015 16:33:29 -0300, Gustavo Zacarias wrote:

> In the f2fs-tools case it's not that simple since sys/queue.h is BSD-3c 
> licensed and couldn't be easily included in a GPL-only source i think.

Why so? According to http://www.gnu.org/licenses/license-list.en.html,
the BSD-3c is compatible with the GPL, i.e you can include BSD-3c code
in a GPL project.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
