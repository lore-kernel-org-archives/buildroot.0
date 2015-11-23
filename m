From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 23 Nov 2015 20:06:13 +0000 (UTC)
Subject: [Buildroot] No 'zip' utility?
References: <n2vp1a$rde$1@ger.gmane.org> <20151123195320.GW2177@tarshish>
Message-ID: <n2vrjl$3jp$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015-11-23, Baruch Siach <baruch@tkos.co.il> wrote:
> On Mon, Nov 23, 2015 at 07:22:18PM +0000, Grant Edwards wrote:
>> I just stumbled across the fact that there doesn't seem to be a 'zip'
>> utility available either as a busybox applet or as a stand-alone
>> utility with a buildroot package.

[...]

> Try the infozip package. Look under "Compressors and decompressors".

Doh!  Thanks.  My (somewhat old) version of buildroot doesn't have an
infozip package, and I somehow missed it when searching through the
git tree to see if a zip utility had been added "recently".

-- 
Grant Edwards               grant.b.edwards        Yow! Maybe I should have
                                  at               asked for my Neutron Bomb
                              gmail.com            in PAISLEY --
