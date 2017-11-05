From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Nov 2017 14:24:20 +0100
Subject: [Buildroot] [PATCH 1/2] dhcpcd: add SysV start-up script
In-Reply-To: <28382f3f-71d0-27d3-f78f-66fe47c9186b@mind.be>
References: <20171031223659.6831-1-code@mmayer.net>
 <20171031223659.6831-2-code@mmayer.net>
 <20171102230602.3c61e8d2@windsurf> <20171102221847.GA23314@scaer>
 <20171102232345.5a434af8@windsurf>
 <3f7fff7b-be5a-42ff-985f-0e860c98acb3@mind.be>
 <20171105081028.GA2996@scaer>
 <28382f3f-71d0-27d3-f78f-66fe47c9186b@mind.be>
Message-ID: <20171105142420.78881fc4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Nov 2017 13:18:29 +0100, Arnout Vandecappelle wrote:

> > Then it is the responsibility of the package.mk to install one if it is
> > mandatory. Otherwise,that means the packaging is incomplete because it
> > does not allow the package to work as expected.  
> 
>  So you mean all packages should do like inadyn: install an example
> configuration file even if that is guaranteed not to work.

Yes, I think it's a good idea if packages install a least some
example/template configuration file, even if indeed it may not work out
of the box in cases such as inadyn.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
