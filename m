From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Nov 2017 22:38:25 +0100
Subject: [Buildroot] [PATCH v2] package/collectd: Specify FP layout
 based on endianness
In-Reply-To: <20171107200442.23067-1-andrew.smirnov@gmail.com>
References: <20171107200442.23067-1-andrew.smirnov@gmail.com>
Message-ID: <20171107223825.1f999b1f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Nov 2017 12:04:42 -0800, Andrey Smirnov wrote:
> Big-endian CPUs store floating point as big endian (at lest majority
> of them do), so, in order for 'network' plugin to work correctly (and
> potentially any user of htond() in collectd's codebase),
> --with-fp-layout=endianflip as opposed to --with-fp-layout=nothing
> needs to be specified during configuration phase.
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Thanks!

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
