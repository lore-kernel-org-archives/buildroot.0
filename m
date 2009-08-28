From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Fri, 28 Aug 2009 07:23:54 +0200
Subject: [Buildroot] [git commit master] u-boot: mark old 2008.10
 version as deprecated
In-Reply-To: <d6cda7730908271838qc80efdfj259e9bf1609f396e@mail.gmail.com>
References: <20090827124024.6B23277691@busybox.osuosl.org>
	<d6cda7730908271838qc80efdfj259e9bf1609f396e@mail.gmail.com>
Message-ID: <20090828072354.38044247@hcegtvedt.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Aug 2009 22:38:25 -0300
Thiago A. Corr?a <thiago.correa@gmail.com> wrote:

> Hi,
> 
>    Someone should test if newer u-boot works properly before doing
> that. This was the last known version to work with AVR32, and if I
> remember it correctly, the problem wasn't platform specific but
> something to do with the flash drivers or something. Sorry, can't be
> more specific, I have a very short memory.
> 

You're right, AVR32 triggered something in the generic flash stuff.

And it is still not fixed...

U-Boot> saveenv
Saving Environment to Flash...
Error: start and/or end address not on sector boundary

I'll need to prod around for that.

-- 
Best regards,
Hans-Christian Egtvedt
