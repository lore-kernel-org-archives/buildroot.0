From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jun 2013 14:37:54 +0200
Subject: [Buildroot] [PATCH] dhcpcd: unavailable for bfin and fix
 another bug
In-Reply-To: <51CED399.8050408@zacarias.com.ar>
References: <1372463785-29537-1-git-send-email-gustavo@zacarias.com.ar>
 <20130629104251.4697be00@skate> <51CEBC51.9030601@zacarias.com.ar>
 <20130629125530.412858a5@skate> <51CED399.8050408@zacarias.com.ar>
Message-ID: <20130629143754.184edb41@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 29 Jun 2013 09:31:21 -0300, Gustavo Zacarias wrote:
> On 06/29/2013 07:55 AM, Thomas Petazzoni wrote:
> 
> >> (all defaults except +IPV6 for dhcpcd).
> >> And 2012R1-RC2 fails to download properly (2012R2-RC2 too for that
> >> matter but i've got a local copy).
> >> I kind of doubt that 2012R1 being older has getifaddrs enabled though.
> > 
> > Yes, one recent patch to the download infrastructure broke this. I
> > should sent a different e-mail with this.
> 
> Downloaded manually and as i supposed, it lacks getifaddrs too.

Yes, of course it lacks getifaddrs, but I don't see how it changes the
point I was making originally: it is not because /some/ external
toolchains are affected that we should exclude an entire architecture
from building a particular package.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
