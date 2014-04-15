From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Apr 2014 14:18:46 -0300
Subject: [Buildroot] [PATCH] libcurl: drop polarssl support
In-Reply-To: <20140415183101.514b6ad2@skate>
References: <1397570346-25849-1-git-send-email-gustavo@zacarias.com.ar>	<20140415181021.5ed849a7@skate>	<534D5CB0.3040301@zacarias.com.ar>
 <20140415183101.514b6ad2@skate>
Message-ID: <534D69F6.4030301@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/15/2014 01:31 PM, Thomas Petazzoni wrote:

> Ok. I guess we can wait for openvpn 2.4 to be released. If that takes
> too long, I'd say we should kill polarssl support in openvpn, because
> it's the one lagging behind. It seems more logical to me to kill that
> one (the one lagging behind) instead of the one being up-to-date (i.e,
> libcurl).

That's debatable, if you don't like openssl support for libcurl
(paranoia, security, friends & family, whatever) you still got other
options, if you do that to openvpn you're stuck since it's the only
other option.
That being said a 2.4 release is quite off IMHO and the polarssl backend
isn't feature-complete compared to openssl, though the paranoia point is
still valid given the heartbleed fallout.
Regards.
