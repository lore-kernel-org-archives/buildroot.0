From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 23 Jun 2014 13:59:51 -0300
Subject: [Buildroot] [PATCHv2 1/2] geoip: new package
In-Reply-To: <20140623163845.GA3400@free.fr>
References: <1403015963-27278-1-git-send-email-gustavo@zacarias.com.ar>
 <20140622215442.4c060328@free-electrons.com>
 <53A759EB.8090702@zacarias.com.ar> <20140622224049.GF21768@free.fr>
 <53A75D10.8050708@zacarias.com.ar> <20140623163845.GA3400@free.fr>
Message-ID: <53A85D07.3070802@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/23/2014 01:38 PM, Yann E. MORIN wrote:

>> Geoipupdate is for commercial users AFAIK, i have no such access/account
>> to test the package. You need to configure a maxmind user/password to
>> make it work, it's not an out-of-the-box experience.
> 
> Well, I don't see where the problem lies. There's nothing that prevents
> us from packaging geoipupdate, even if it requires a runtime
> configuration with a login+password.
> 
> That's basically the same as for a webserver: we do package more than
> one webserver, but the user is still responsible for providing the
> content of the server-root.

I disagree a bit there, but then people are free to do what they like,
like shipping a probably toughly-licensed user/pass combination in
plaintext in a firmware which someone else can pick up and use let's say
in shady terms :)
It's mostly intended for servers where access is restricted and that
wouldn't happen normally.

>> Someone who has might be interested to make it though.
> 
> I agree with you on that. ;-)

I like to test new packages a bit, and getting the help just doesn't
feel like a proper test, hence my reluctance ;)
Regards.
