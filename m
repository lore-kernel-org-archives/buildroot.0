From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Oct 2013 08:12:12 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-10-24
In-Reply-To: <526B9237.8030602@zacarias.com.ar>
References: <20131025063005.51B7752C609@lolut.humanoidz.org>	<526A26EB.7010804@mind.be>	<20131025124746.0dbffd63@skate>	<526A4D39.3040106@zacarias.com.ar>
 <20131026084741.5cab8678@skate> <526B9237.8030602@zacarias.com.ar>
Message-ID: <526E468C.7080008@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/26/2013 06:58 AM, Gustavo Zacarias wrote:

> WTF? (and it's working just fine from .ar at exactly the same time).
> I'll try contacting hetzner about it since i can ping it, but not http
> to it.
> Regards.

Hetzner reached back and their opinion is that they're firewall rules
(because ping+trace work and http doesn't).
I don't know their networking setup but it sounds reasonable (some odd
balancer setup might show these symptoms).
I guess the server admin is a bit aggresive on recurrent fetchers.
Which moves me to the question, shouldn't the autobuilders just build?
Checking the sources is great but it shouldn't be so aggresive on
upstream servers, small projects might not be so happy about it.
I know this has to be coded but maybe it's time.
Regards.
