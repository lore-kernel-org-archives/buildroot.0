From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Aug 2016 21:48:03 +0200
Subject: [Buildroot] Access to Buildroot git via https
In-Reply-To: <1468919638.5489.0.camel@synopsys.com> (Alexey Brodkin's message
 of "Tue, 19 Jul 2016 09:15:20 +0000")
References: <1468831359.3068.19.camel@synopsys.com>
 <20160719062852.GA3656@free.fr>
 <20160719091308.5aea4608@free-electrons.com>
 <1468919638.5489.0.camel@synopsys.com>
Message-ID: <87vazhiqh8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

Hi,

 >> > I just tried this:
 >> > 
 >> > ????$ git clone https://git.busybox.net/buildroot/
 >> > ????Cloning into 'buildroot'...
 >> > ????[...]
 >> Then it is sad that the https:// address is not mentioned in
 >> https://git.buildroot.org/buildroot/ under the "Clone:" section.

 > That's exactly what I meant - why don't we add that URL there?

I've taken a look at the cgit documentation and added it now, thanks.

-- 
Bye, Peter Korsgaard
