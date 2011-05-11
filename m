From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 11 May 2011 09:24:48 +0200
Subject: [Buildroot] [git commit] Create menu entry to select device
 creation method
In-Reply-To: <1305095640.3323.331.camel@esp-patben-lin.espdx1.local>
References: <20110510215121.7252A826FF@busybox.osuosl.org>
	<1305095640.3323.331.camel@esp-patben-lin.espdx1.local>
Message-ID: <4DCA39C0.9030000@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 11.05.2011 08:34, schrieb Patryk Benderz:
> [cut]
>> All dynamic methods are based on devtmpfs, so one doesn't need to care
>> about /dev folder.
> Hi Yegor,
> thanks for this patch, but if using one of additional methods, will I
> still be able to limit number os virtal consoles via /etc/inittab? This
> should be doable, right?
> [cut]

Yes. devtmpfs just creates devices announced by the kernel. In inittab you assign ttys to getty.

Yegor
