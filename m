From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Jul 2020 21:34:46 +0200
Subject: [Buildroot] start-stop-daemon failing due to option -q
In-Reply-To: <CAF8i9mMxkOdD0bcjcrSHbOVxs5fJsz9X__dKC5EzDUG9O_L21Q@mail.gmail.com>
References: <CAF8i9mOOn0pU=1u79T_=hgNmxBbi_en_QZ=puossyLFgzrExSw@mail.gmail.com>
 <20200712213126.59c57981@windsurf.home>
 <CAF8i9mMZ1Je-SUDHkDX97ijv8FT68D0Mz9-6D6-tw51U3ZkPnw@mail.gmail.com>
 <CAF8i9mMxkOdD0bcjcrSHbOVxs5fJsz9X__dKC5EzDUG9O_L21Q@mail.gmail.com>
Message-ID: <20200721213446.6f8e631b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Jul 2020 15:18:19 -0400
William Tambe <tambewilliam@gmail.com> wrote:

> > Are you able to run start-stop-daemon with the -q option ?  
> 
> Is anyone else seeing the issue of start-stop-daemon failing when the
> option -q is used ?

I still don't see how it is possible to not have support for the -q
option in start-stop-daemon, I don't see any conditional in the Busybox
source code.

Could you provide the Buildroot configuration and Busybox configuration
that exhibits the issue ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
