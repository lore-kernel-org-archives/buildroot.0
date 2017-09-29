From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Sep 2017 16:15:21 +0200
Subject: [Buildroot] [PATCH] package/flex: really disable flex program
In-Reply-To: <20170929140405.GH2899@scaer>
References: <20170929134709.24221-1-yann.morin.1998@free.fr>
 <20170929154902.058b9a48@windsurf.lan>
 <20170929140405.GH2899@scaer>
Message-ID: <20170929161521.28827084@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Sep 2017 16:04:05 +0200, Yann E. MORIN wrote:

> > This will also disable the build of flex the program in host-flex,
> > which is not good: we want host-flex to install the flex program.  
> 
> Right, I missed that in turn.
> 
> I guess I'll have to early-port your flex patch instead... Sigh...

There's a reason why I added a --disable-something option in the first
place :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
