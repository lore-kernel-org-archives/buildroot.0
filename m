From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jan 2015 09:37:43 +0100
Subject: [Buildroot] ldconfig - unknown machine 40
In-Reply-To: <1421331834928-90477.post@n4.nabble.com>
References: <loom.20130628T172450-675@post.gmane.org>
 <1421331834928-90477.post@n4.nabble.com>
Message-ID: <20150116093743.6b1de43f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthias 'muh' Pauligk,

On Thu, 15 Jan 2015 06:23:54 -0800 (PST), Matthias 'muh' Pauligk wrote:

> I faced the same problem using buildroot's toolchain.
> The ld-config is present in the host directory, but the Makefile is looking
> at the wrong path.
> So I made a small patch to fix this issue, which is working fine for me:

The problem is unfortunately not that simple: yes you have a ldconfig
for glibc toolchains. But not for uClibc based toolchains.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
