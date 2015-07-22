From: =?UTF-8?Q?Guillaume_GARDET_-_Olis=c3=a9o?= <guillaume.gardet@oliseo.fr>
Date: Wed, 22 Jul 2015 11:34:52 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150722094349.424e7a3e@free-electrons.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
Message-ID: <55AF63BC.5040103@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


Le 22/07/2015 09:43, Thomas Petazzoni a ?crit :
> Hello,
>
> Brendan, Alexey, Clayton, Gustavo, J?rg, Guillaume, Marcin, Waldemar,
> Nicolas, Bernd, Johan, R?mi, Paul, Max,Samuel, Vicente, Yegor, Yann,
> please have a look below. Some of the build failures need your
> help/attention. Thanks!

[...]

>
>>          i686 |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/2a07d48d638f20b9fb58923c37f7c44d4e4b72d5/
>>       powerpc |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/f66f128a05e80c5f4d072d019569b849615d94e6/
>>           arm |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/aa8988bb5f36491ce58681a52a11441353eb4dad/
> ERROR: unsafe header/library path used in cross-compilation: '/usr/lib/'
>
> Guillaume, since you are the original submitter or c-icap-modules, can
> you have a look?

I think this is the c-icap-config script (from c-icap package) which pass wrong lib path.

I will try to have a look at it this week.


Guillaume
