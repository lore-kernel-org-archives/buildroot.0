From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:55:40 +0100
Subject: [Buildroot] [PATCH 1/1] ntp: implicitly enable openssl-random
In-Reply-To: <20171111233506.04e40d0a@windsurf.home>
References: <20171108131839.27491-1-aduskett@gmail.com>
 <20171111233506.04e40d0a@windsurf.home>
Message-ID: <20171122225540.35acf7a2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Nov 2017 23:35:06 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed,  8 Nov 2017 08:18:39 -0500, Adam Duskett wrote:
> > If OpenSSL is selected, --enable-openssl-random should be implicitly
> > set as well.  
> 
> So you meant "explicitly", right ?

Ping ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
