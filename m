From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 30 Jan 2014 16:25:40 -0300
Subject: [Buildroot] powerpc64 support
In-Reply-To: <52EAA6E8.7000805@coloradoengineeringinc.com>
References: <52EA95DB.70504@coloradoengineeringinc.com>
 <52EA9EE2.80807@zacarias.com.ar>
 <52EAA6E8.7000805@coloradoengineeringinc.com>
Message-ID: <52EAA734.6030909@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/30/2014 04:24 PM, Danny Gale wrote:

> Gustavo,
> 
> Thanks for getting back to me so quickly. Would it be preferred to add
> to Config.in.powerpc, or create Config.in.powerpc64?

We prefer it in the same file like it's done for mips, x86 and other
architectures that have 32/64 bit variants.
Regards.
