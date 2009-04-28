From: Steffen Schulz <pepe_ml@gmx.net>
Date: Tue, 28 Apr 2009 11:10:39 +0200
Subject: [Buildroot] No network interface when used as DomU
In-Reply-To: <20090427173625.GA19953@cbg.dyndns.org>
References: <20090427173625.GA19953@cbg.dyndns.org>
Message-ID: <20090428091038.GA21964@cbg.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 090427 at 19:45, Steffen Schulz wrote:
> Does anybody know what this can be? Do I need to compile against
> xen-kernel? Am I missing some switches? Does some lib/tool not support
> virtual xen interfaces?

Nevermind. The stock opensuse kernel has the xen pseudo driver as
a module, so it needs to be in the ramdisk of course..

-- 
pepe at unixfan.net                            gpg --recv-key A04D7875
Key fingerprint: B805 57BE E4AF 0104 CC51  77A1 CE6F 8D46 A04D 7875
