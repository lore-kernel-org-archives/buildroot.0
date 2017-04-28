From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 Apr 2017 22:17:37 +0200
Subject: [Buildroot] [PATCH] x11vnc: update to 0.9.14
In-Reply-To: <20170426100320.00702ce9@free-electrons.com>
References: <1493036541-26331-1-git-send-email-martin.kepplinger@ginzinger.com>
 <3cc20a82-673d-f87b-e5c6-0acc428cfb1c@ginzinger.com>
 <9cbb711a-6026-8a69-a6c6-85dc140e2e4c@imgtec.com>
 <d6771575-8b26-f608-5d57-4d3c573eee36@ginzinger.com>
 <e8750710-f475-fe87-79a4-edd6f655d5a0@mind.be>
 <20170426100320.00702ce9@free-electrons.com>
Message-ID: <328df89e-01f6-d25f-d2b8-6ac111f7e06c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-04-17 10:03, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 24 Apr 2017 21:47:58 +0200, Arnout Vandecappelle wrote:
> 
>>  Is there a reason why you need this bump?
> 
> Well, do we need a reason to bump a package, other than "upstream has a
> new release, possibly with new features/bug fixes" ? Tons of version
> bumps we merged are not motivated by a specific reason, other than
> making sure Buildroot uses recent versions of the different components.

 Why did you remove the part that explains exactly this?

>> On Mon, 24 Apr 2017 21:47:58 +0200, Arnout Vandecappelle wrote:
>>>  We indeed prefer to stick to officially released versions when upstream has
>>> them. And we generally don't like to take releases that upstream considers a
>>> development/alpha/... release.

 Quoting the x11vnc website [1]:

-----
As of Sep 2011, the x11vnc-0.9.13.tar.gz source package is released (recommended
download). [...] Also, you can get a copy of my latest, bleeding edge
x11vnc-0.9.14-dev.tar.gz tarball to build the most up to date one.
-----


 However, I didn't actually read that website before, I just read Vicente's
comment. If I had read the website, I would have noticed that it refers to a
-dev tarball, and that at the time it was expected that a real release would
happen end of 2011.

 With that in mind, I think we can conclude that the website is simply out of
date and should be relied on, and that there is no reason not to bump to 0.9.14.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
