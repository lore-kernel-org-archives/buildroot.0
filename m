From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Nov 2013 18:26:56 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-11-22
In-Reply-To: <CAAXf6LWFAGDvHV42Mvc2_uhnFtthuCX-N5ZLogdW5u1k9XSkSQ@mail.gmail.com>
References: <20131123073002.EA89E101432@stock.ovh.net>
 <CAAXf6LWFAGDvHV42Mvc2_uhnFtthuCX-N5ZLogdW5u1k9XSkSQ@mail.gmail.com>
Message-ID: <20131123182656.77936e93@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sat, 23 Nov 2013 14:11:43 +0100, Thomas De Schampheleire wrote:

> >        arm |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/e5484bcdcca7f2cb48913d65271de4b957ea3450/

It's a fairly old toolchain that I've built with Crosstool-NG. It uses
uClibc 0.9.33.2, but there might be some missing uClibc configuration
options, or the kernel headers might be old.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
