From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 17 Apr 2007 17:07:22 +0200
Subject: [Buildroot] which ipkg?
In-Reply-To: <20070417111330.GB12656@zelow.no>
References: <20070417101631.GA12039@zelow.no> <20070417111330.GB12656@zelow.no>
Message-ID: <20070417150722.GJ23570@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 17, 2007 at 01:13:30PM +0200, Thomas Lundquist wrote:
>On Tue, Apr 17, 2007 at 12:16:31PM +0200, Thomas Lundquist wrote:
>> 
>> The big question is; which ipkg version should I/we go for?
>> handhelds.org has at least two options, the original shell script based
>> (ipkg-utils) or a C-based newer one.
>
>Seems like I should read a bit more about ipkg.
>
>http://handhelds.org/moin/moin.cgi/BuildingIpkgs uses ipkg-utils for
>building / host side and not the target. 
>
>so, it seems like they are using the C-version for unpaking/target side.
>
>OpenWRT also uses ipkg and have a ipkg shell script in their repository
>but I haven't looked much at what / how they use.
>
>So, if anyone out there would like ipkg support in buildroot, let me
>know how you want it and I'll try to fix it. I guess it's quite obvious
>that I'm not familiar nor using ipkg :=)

Ideally, we want ipkg in busybox, ultimately. I once looked at the
normal ipkg for a few minutes, and from what i remember, providing
a nice, working and small applet from it (by rewriting it) looked quite
reasonable, fwiw.
