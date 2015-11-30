From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Nov 2015 17:24:58 +0100
Subject: [Buildroot] Compile kernel module within buildroot package
In-Reply-To: <20151119183653.GA1025@arthur-bzh>
References: <20151119183653.GA1025@arthur-bzh>
Message-ID: <20151130172458.0a226cd6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arthur LAMBERT,

On Thu, 19 Nov 2015 19:36:53 +0100, Arthur LAMBERT wrote:

> I am currently using the 2015.08 version of buildroot. Kernel module compilation
> is broken :

This problem has been fixed in 2015.08.1, you should upgrade to this
version (which has just three commits on top of 2015.08), or
alternatively backport

  http://git.buildroot.net/buildroot/commit/?h=2015.08.x&id=16768877e324f6e3e1291613ae5db9af0da5a2bf

I was able to reproduce your problem on 2015.08, and with just this
commit applied, lttng-modules could be built successfully.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
