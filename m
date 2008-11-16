From: Hamish Moffatt <hamish@cloud.net.au>
Date: Mon, 17 Nov 2008 10:42:33 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
In-Reply-To: <874p28ekyy.fsf@macbook.be.48ers.dk>
References: <20081113163256.D28F83C8A1@busybox.net>
	<BD79186B4FD85F4B8E60E381CAEE1909D3E78E@mi8nycmail19.Mi8.com>
	<874p28ekyy.fsf@macbook.be.48ers.dk>
Message-ID: <20081116234233.GF16858@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 15, 2008 at 10:29:57PM +0100, Peter Korsgaard wrote:
> >>>>> "hartleys" == hartleys  <hartleys@visionengravers.com> writes:
> 
> Hi,
> 
>  hartleys> With revision 24042 of buildroot I get an error building busybox. During
>  hartleys> the build I get:
> 
> Yes, busybox 1.13.0 id applet requires functionality not available in
> uclibc 0.9.29 / 0.9.28.

OR, you can enable CONFIG_USE_BB_PWD_GRP and busybox will use its
internal getgrouplist (etc) rather than requiring one from libc.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
