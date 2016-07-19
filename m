From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 19 Jul 2016 09:15:20 +0000
Subject: [Buildroot] Access to Buildroot git via https
In-Reply-To: <20160719091308.5aea4608@free-electrons.com>
References: <1468831359.3068.19.camel@synopsys.com>
 <20160719062852.GA3656@free.fr>
 <20160719091308.5aea4608@free-electrons.com>
Message-ID: <1468919638.5489.0.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Yann,

On Tue, 2016-07-19 at 09:13 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 19 Jul 2016 08:28:52 +0200, Yann E. MORIN wrote:
> > 
> > Alexey, All,
> > 
> > On 2016-07-18 08:44 +0000, Alexey Brodkin spake thusly:
> > > 
> > > I'm wondering if there's a way to access Buildroot main git repo via HTTPS?
> > > Here (https://git.busybox.net/buildroot/) it is mentioned only git protocol URL:??
> > I just tried this:
> > 
> > ????$ git clone https://git.busybox.net/buildroot/
> > ????Cloning into 'buildroot'...
> > ????[...]
> Then it is sad that the https:// address is not mentioned in
> https://git.buildroot.org/buildroot/ under the "Clone:" section.

That's exactly what I meant - why don't we add that URL there?

-Alexey
