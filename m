From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 08 Apr 2015 16:29:00 -0300
Subject: [Buildroot] [PATCH 3/3] php: add opcache option
In-Reply-To: <20150408212655.2a4fe0cd@free-electrons.com>
References: <1428507569-28044-1-git-send-email-gustavo@zacarias.com.ar>	<1428507569-28044-3-git-send-email-gustavo@zacarias.com.ar>
 <20150408212655.2a4fe0cd@free-electrons.com>
Message-ID: <5525817C.2060302@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/08/2015 04:26 PM, Thomas Petazzoni wrote:

> Would have been a nicer (and potentially upstreamable) solution to have
> a AC_CACHE_VAL that allows to prefeed the result of the tests from the
> configure environment.
> 
> Applied anyway, thanks!

Yes, all of these patches were a first round of getting things cleaner,
maybe not 100% clean but cleaner, and get the features, opcache has been
included since 5.5.x but we never got it because it was somewhat
difficult to get nicely (specially with 5.5.x not being nice to
buildconf either).
Regards.
