From: Bernhard Fischer <rep.nop@aon.at>
Date: Thu, 14 Sep 2006 19:16:25 +0200
Subject: [Buildroot] Buildroot fails on powerpc with busybox login.c
In-Reply-To: <200609141900.12420.vda.linux@googlemail.com>
References: <45043EA7.5070709@pacbell.net> <20060913154433.GC13069@aon.at>
	<200609141900.12420.vda.linux@googlemail.com>
Message-ID: <20060914171625.GB23891@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 14, 2006 at 07:00:12PM +0200, Denis Vlasenko wrote:
>On Wednesday 13 September 2006 17:44, Bernhard Fischer wrote:

>> r16112 has a partial fix to make it build again. We (e.g. vda ;) should
>> provide empty bodies for read_or_build_utent() and write_utent() if UTMP
>> support is disabled. This can go hand in hand with removing the
>> pointless forward decls for said functions.
>
>Done ;)

Thanks for taking care of this.
cheers,
Bernhard
