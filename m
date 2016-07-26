From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 21:30:21 +0200
Subject: [Buildroot] [PATCH v3] package/pdbg: new package
In-Reply-To: <1469518104-19678-1-git-send-email-joel@jms.id.au>
References: <1469429593-28546-1-git-send-email-joel@jms.id.au>
 <1469518104-19678-1-git-send-email-joel@jms.id.au>
Message-ID: <20160726213021.0b7a7538@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 16:58:24 +0930, Joel Stanley wrote:
> PowerPC FSI Debugger, for low level debugging of a Power8 CPU over FSI.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v3:
>  - do not restrict to ARM, as it builds on all CPU architectures
>  - metion where you might want to run pdbg in the help text
> 
> v2:
>  - Fix whitespace in pdbg.mk
>   - Add URL to help text
> 
>  package/pdbg/Config.in | 10 ++++++++++
>  package/pdbg/pdbg.mk   | 13 +++++++++++++

You forgot to add the package to package/Config.in, and to add a hash
file. I've added both and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
