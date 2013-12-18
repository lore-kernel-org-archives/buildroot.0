From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Dec 2013 10:48:12 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-12-17
In-Reply-To: <20131218073008.6219E100A64@stock.ovh.net>
References: <20131218073008.6219E100A64@stock.ovh.net>
Message-ID: <20131218104812.62edfd68@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Dec 2013 08:30:08 +0100 (CET), Thomas Petazzoni wrote:

>            python-pycrypto-2.6 | 8 
>               python-pyasn-1.2 | 6 

I have worked on those issues. They are caused by incorrect header and
library paths being passed. The pycrypto header problem is quite easy,
the library path is a little bit trickier, but I'm working on it. I
will be posting patches as soon as possible.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
