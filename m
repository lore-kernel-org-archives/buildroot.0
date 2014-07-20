From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 12:19:39 +0200
Subject: [Buildroot] [PATCH 2/2] perf: Don't build backtrace for ARC
In-Reply-To: <CAAXf6LWJqKV-FFUXycBMNvOFZ+CyosFMPb9khmr9x9=Ug6q7xQ@mail.gmail.com>
References: <1390914658-18198-1-git-send-email-mjonker@synopsys.com>
 <CAAXf6LWJqKV-FFUXycBMNvOFZ+CyosFMPb9khmr9x9=Ug6q7xQ@mail.gmail.com>
Message-ID: <20140720121939.5585cb1f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 18 Jul 2014 22:16:44 +0200, Thomas De Schampheleire wrote:

> Could you give more details as to why this is needed?
> I see no autobuild failures for perf on ARC, so what is the problem here?

Since perf has 'depends on BR2_LINUX_KERNEL', it is never built by the
autobuilders.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
