From: Aleksandar Zivkovic <Aleksandar.Zivkovic@rt-rk.com>
Date: Thu, 28 Jun 2012 00:03:21 +0200
Subject: [Buildroot] Using Buildroot generated toolchain on different
 machine without Buildroot environment
In-Reply-To: <20120626175810.5725388e@skate>
References: <jscj4m$j2p$1@dough.gmane.org> <20120626171906.5ea51e6a@skate>
 <jsclju$7qc$1@dough.gmane.org> <20120626175810.5725388e@skate>
Message-ID: <jsfvv6$6l2$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/06/2012 17:58, Thomas Petazzoni wrote:
> Le Tue, 26 Jun 2012 15:48:14 +0000 (UTC),
> Grant Edwards<grant.b.edwards@gmail.com>  a ?crit :
>
>> Toolchains built with crosstool-ng can be moved anywhere, but all you
>> end up with is the basic "libc" libraries.  You'll have to copy the
>> libraries built by buildroot manually if you want to use them on the
>> other hosts.
>
> Correct, but many things besides the toolchain contain hardcoded paths:
> the pkg-config binary, the external toolchain wrapper, the .la files,
> etc. See the report I mentioned for details.
>
> Thomas
Hi all,

@Thomas: when I used the same path on other machine build works 
correctly. Thanks again for quick response!

@Grant: I agree, besides libc I'm using complete generated host 
directory which holds other libraries that might be needed. Thanks for 
hint!

Regards,
Aleksandar
