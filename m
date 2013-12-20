From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 20 Dec 2013 17:01:01 +0100
Subject: [Buildroot] [PATCH v10 0/8] Add support for top-level parallel
	make
In-Reply-To: <52B4666E.5080207@mind.be>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
 <52B32DF1.2010702@mind.be>
 <CAHkwnC9J_4GOPSLtP2KWLD9YipFV+hVadXc_RrkjvNoYQ2oJew@mail.gmail.com>
 <20131220163423.4574d257@skate> <52B4666E.5080207@mind.be>
Message-ID: <CAHkwnC9bZSrH5Qu2f1Haxzycz_4A6RJbySx5oKONYVXHensVpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 20, 2013 at 4:46 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 20/12/13 16:34, Thomas Petazzoni wrote:
>>
>> Dear Fabio Porcedda,
>>
>> On Fri, 20 Dec 2013 15:36:56 +0100, Fabio Porcedda wrote:
>>
>>> The autobuild does not try to test allpackageyesconfig, does it?
>>
>>
>> But, the autobuild is not designed for that. However, an
>> allyespackageconfig configuration is something we could add to the
>> Jenkins if you want.

I think It would be great.
IMHO it's a useful test because this way we know if packages build
fine at least with the default config.
Building again the default config is the first test that a package
must pass, doesn't it?

>
>  If you do that, expect it to fail :-)
>
>  It will certainly fail if you include a kernel in that config: some
> packages (Xenomai, rtnet, some modules) only work with certain kernel
> versions and AFAIK there is no single kernel that works for all these
> packages.
>
>  Not building a kernel excludes many packages so may give you more luck.

Thanks and best regards
-- 
Fabio Porcedda
