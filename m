From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 6 Feb 2018 06:15:04 +0200
Subject: [Buildroot] [PATCH 5/5] package/glibc: bump to 2.27
In-Reply-To: <20180205214157.GC2806@scaer>
References: <20180205205716.4279-1-romain.naour@gmail.com>
 <20180205205716.4279-5-romain.naour@gmail.com>
 <20180205210150.ok3hhfucmxu3uz3l@tarshish>
 <20180205214157.GC2806@scaer>
Message-ID: <20180206041504.u2uu4gd4d2d7wopn@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Feb 05, 2018 at 10:41:57PM +0100, Yann E. MORIN wrote:
> On 2018-02-05 23:01 +0200, Baruch Siach spake thusly:
> > On Mon, Feb 05, 2018 at 09:57:16PM +0100, Romain Naour wrote:
> > > See: https://sourceware.org/ml/libc-announce/2018/msg00000.html
> > > https://sourceware.org/glibc/wiki/Release/2.27
> > Note that this is a security bump fixing CVE-2017-1000408, CVE-2017-1000409, 
> > CVE-2017-16997, CVE-2018-1000001, and CVE-2018-6485.
> 
> There are 10 CVE listed in the release annoucement mail, but you list
> only five here. Why only those?

Because all other CVEs were fixed in the 2.26 stable branch that we currently 
use. See 971ed9653e (glibc: security bump to the latest 2.26 branch).

> Do we want to list all the CVEs fixed in a release? And if we don't list
> all, why do we even list only a subset?

We do list all. See above.

> I don't think we should, especially since the release mail is linked to
> the commit log and has all the details.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
