From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Feb 2016 00:04:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/gdb: add optional support for xz
In-Reply-To: <56BBAA42.7000604@mind.be>
References: <1455137950-18164-1-git-send-email-bernd.kuhls@t-online.de>
 <56BBAA42.7000604@mind.be>
Message-ID: <20160211000422.0ca767c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 10 Feb 2016 22:23:14 +0100, Arnout Vandecappelle wrote:

>  This would obviously be needed for host-gdb as well, but that is impossible to
> handle without explicit host Config.in options.
> 
>  I really think we should go that way, there are several problems that need it.

Or explicitly disable such features in host-gdb ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
