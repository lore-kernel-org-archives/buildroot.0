From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 18 Jul 2013 08:08:11 -0300
Subject: [Buildroot] [PATCH] arch/arm: add support for thumb(1) mode
In-Reply-To: <20130718091917.06476a78@skate>
References: <1374075555-9599-1-git-send-email-gustavo@zacarias.com.ar>
 <20130717175838.2fc2831e@skate> <51E6C06C.8070300@zacarias.com.ar>
 <20130717215826.60942218@skate> <51E719D4.4070304@zacarias.com.ar>
 <20130718091917.06476a78@skate>
Message-ID: <51E7CC9B.1070109@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/18/2013 04:19 AM, Thomas Petazzoni wrote:

> We definitely do something. If you enable Thumb in the configuration,
> then -mthumb gets hard-coded into the external toolchain wrapper. If you
> enable ARM in the configuration, then -marm gets hard-coded into the
> external toolchain wrapper.
> 
> See:
> http://git.buildroot.net/buildroot/tree/toolchain/toolchain-external/ext-tool.mk#n183
> and:
> http://git.buildroot.net/buildroot/tree/toolchain/toolchain-external/ext-toolchain-wrapper.c#n50.

Missed that!
It's working though, tested on real hardware (arm920t) with CS 2013.05
Regards.
