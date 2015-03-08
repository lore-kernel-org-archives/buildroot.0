From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 18:31:22 +0100
Subject: [Buildroot] [PATCH v3 2/2] wine: Add gettext dependency check
 for host-wine
In-Reply-To: <54FC67E8.7010004@dawncrow.de>
References: <54FC5B41.5050004@dawncrow.de>
 <20150308155730.11c74ecc@free-electrons.com>
 <54FC67E8.7010004@dawncrow.de>
Message-ID: <20150308183122.308f9227@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Sun, 08 Mar 2015 16:16:56 +0100, Andr? Hentschel wrote:

> Wine is built using host-wine, so i need gettext support in host-wines wrt.

In which cases do you need gettext support in host-wine?

Always ? Only when the target wine is going to be built with gettext
support (which your patch does not do) ?

Why in the first place would we want to have gettext support in
host-wine ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
