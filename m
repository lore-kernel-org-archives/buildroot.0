From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Dec 2016 09:22:38 +0100
Subject: [Buildroot] [PATCH v2] package/xen: Update to version 4.8.0
In-Reply-To: <CAKmqyKOMOCfa3+BAsdOuAOSy+acQnSTjQOcr9H2XxQbd1e9t4w@mail.gmail.com>
References: <1482445317-9435-1-git-send-email-alistair.francis@xilinx.com>
 <20161222235936.018f7807@free-electrons.com>
 <CAKmqyKOMOCfa3+BAsdOuAOSy+acQnSTjQOcr9H2XxQbd1e9t4w@mail.gmail.com>
Message-ID: <20161223092238.3a692c89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Dec 2016 17:09:42 -0800, Alistair Francis wrote:

> I need to do that as well as unset the CFLAGS (I need to replace it
> with APPEND_CFLAGS).
> 
> If I did the same thing but stored it in a Xen specific variable would
> that be ok?

How did you "unset" the CFLAGS ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
