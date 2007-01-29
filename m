From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 29 Jan 2007 22:55:37 +0100
Subject: [Buildroot] My first patch :-) (updated soekris support)
In-Reply-To: <200701241355.57979.elric-brl@ikuszen.com>
References: <200701221950.27856.elric-brl@ikuszen.com>
	<200701241355.57979.elric-brl@ikuszen.com>
Message-ID: <20070129215537.GA28221@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 24, 2007 at 01:55:57PM +0100, Elric Milon wrote:
>El Lunes 22 Enero 2007 19:50, Elric Milon escribi?:
>> Well, this is the first one, it unbreaks soekris 4801 support, and updates
>> the kernel used to 2.6.19.2 version.
>>
>> I'ts my first patch, so maybe something is not right. Constructive
>> cryticism is welcome :-)
>>
>> Regards!
>
>Ok, second attempt, smaller patch and cleaner.
>
>Remember to delete:
>
>target/device/Soekris/net4801/linux*.mk
>target/device/Soekris/net4801/linux.config

I've applied you patch, thanks.

I'll take care of generalizing the linux26 target so that other arches
also can use it by just passing their name and a config in. That config
will be overridable by a path specified on the command-line (see
docs/README for other examples for this, or
buildroot.uclibc.org/buildroot.html for that matter).
