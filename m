From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Oct 2015 16:34:59 +0200
Subject: [Buildroot] [PATCH] tcpdump: drop unneeded security patches
In-Reply-To: <560E7A6F.2060508@zacarias.com.ar> (Gustavo Zacarias's message of
 "Fri, 2 Oct 2015 09:37:03 -0300")
References: <8eab1f5310d5dac8ab6e17bc5a0e4fdf5d3017ad.1443699935.git.baruch@tkos.co.il>
 <560E7A6F.2060508@zacarias.com.ar>
Message-ID: <878u7libjg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

>> Just drop these patches.
 >> 
 >> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
 >> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 > Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

 > However i don't like upstream policy regarding vulns, there's no
 > direct mention of these CVEs anywhere, it's very vague and hard to
 > track.

Yes, that sounds like quite a mess :/

Committed, thanks.

-- 
Bye, Peter Korsgaard
