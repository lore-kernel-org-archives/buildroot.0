From: oreddy <oreddy@rfnetech.com>
Date: Thu, 26 Apr 2012 20:18:45 +0800
Subject: [Buildroot] error toolchain build for mips-linux-uclibc with
 BR2_INSTALL_LIBSTDCPP
In-Reply-To: <20120426140413.3f394243@skate>
References: <CAAawjsQQ0nc9HYYAegCTs6sRM+rwXhimyV83hB+jwR6bo1B=SA@mail.gmail.com>
 <4F991F94.50608@rfnetech.com> <20120426140413.3f394243@skate>
Message-ID: <4F993D25.8070906@rfnetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/4/2012 8:04 PM, Thomas Petazzoni wrote:
> Le Thu, 26 Apr 2012 18:12:36 +0800,
> oreddy<oreddy@rfnetech.com>  a ?crit :
>
>> Build root version 2009.08 and i have attached the config file.
> Can you try with a more recent Buildroot version? It's very unlikely
> that the community will be interested in fixing problems on such an old
> version, especially since we have done a lot of changes and
> improvements in Buildroot over the last few years, so 2009.08 is quite
> radically different from 2012.02 that we would recommend to use.
>
> Best regards,
>
> Thomas
Thomas,

Yeah absolutely correct, but I think it needs more time to test the 
whole build and applications running on it again.

Anyhow when I was goggling, found a patch 
http://git.buildroot.net/buildroot/commit/?id=6b578c8d73b6403e3be8bddf611fb1059d7c2f4b 
which is more related to this issue. Will try this and come back.

Last option is to try a new build root.

Regards,
Reddy.
