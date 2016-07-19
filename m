From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jul 2016 09:13:08 +0200
Subject: [Buildroot] Access to Buildroot git via https
In-Reply-To: <20160719062852.GA3656@free.fr>
References: <1468831359.3068.19.camel@synopsys.com>
 <20160719062852.GA3656@free.fr>
Message-ID: <20160719091308.5aea4608@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Jul 2016 08:28:52 +0200, Yann E. MORIN wrote:
> Alexey, All,
> 
> On 2016-07-18 08:44 +0000, Alexey Brodkin spake thusly:
> > I'm wondering if there's a way to access Buildroot main git repo via HTTPS?
> > Here (https://git.busybox.net/buildroot/) it is mentioned only git protocol URL:  
> 
> I just tried this:
> 
>     $ git clone https://git.busybox.net/buildroot/
>     Cloning into 'buildroot'...
>     [...]

Then it is sad that the https:// address is not mentioned in
https://git.buildroot.org/buildroot/ under the "Clone:" section.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
