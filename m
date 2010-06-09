From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 9 Jun 2010 04:58:35 +0300
Subject: [Buildroot] [PATCH] skeleton: remove loopback interface
 configuration from inittab
In-Reply-To: <20100607092312.7e736feb@surf>
References: <acc7c503a6179494174d8225e121b23d69a24b61.1275543349.git.baruch@tkos.co.il>
	<20100607092312.7e736feb@surf>
Message-ID: <20100609015835.GD2318@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jun 07, 2010 at 09:23:12AM +0200, Thomas Petazzoni wrote:
> On Thu,  3 Jun 2010 08:36:50 +0300
> Baruch Siach <baruch@tkos.co.il> wrote:
> 
> > The lo interface is marked auto in /etc/network/interfaces, so the
> > configuration of the loopback network interface is part of the
> > S40network init script. This causes the "RTNETLINK answers: File exists" error
> > message to appear at startup time.
> 
> Not tested, but I think it's ok.
> 
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks.

Any chance of this being accepted upstream?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
