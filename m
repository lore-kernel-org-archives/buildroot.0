From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 02 Jul 2014 10:01:38 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-07-01
In-Reply-To: <20140702094513.6ec730f0@free-electrons.com>
References: <20140702063009.4715D1017F9@stock.ovh.net>
 <20140702094513.6ec730f0@free-electrons.com>
Message-ID: <53B402B2.30600@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/2014 04:45 AM, Thomas Petazzoni wrote:

> Hello,
> 
> On Wed,  2 Jul 2014 08:30:09 +0200 (CEST), Thomas Petazzoni wrote:
> 
>>       bfin |                      crda-3.13 | NOK | http://autobuild.buildroot.net/results/d752a8d53ad9219b60113075c91c4dcc3e4027c1/
> 
> This thing is trying to build a shared library even though we have
> BR2_PREFER_STATIC_LIB=y.

Patch sent disabling it for static.

>>    powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/6c8c3cb19a6f98f6f27986b671d48ee092fdf7cc/
> 
> Compiler issue. I don't see any other solution than adding an exclusion
> in the autobuilder script. Yann, Gustavo, any idea?

That looks like PR60155, i'll run some tests.

Regards.
