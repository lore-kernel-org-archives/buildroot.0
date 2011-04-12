From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 12 Apr 2011 14:03:52 -0300
Subject: [Buildroot] Conditional patches (php package)
In-Reply-To: <4D753524.5050306@daccii.it>
References: <4D753524.5050306@daccii.it>
Message-ID: <4DA485F8.4080608@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/07/11 16:42, Daniele Salvatore Albano - Lavoro wrote:

> Hi to all,
> 
> i'm trying to add support for php 5.3(.5), mantaining the ability to
> compile php 5.2(.17) for compatibility reasons.
> 
> The main problem is a patch that is in php 5.3.5 sources but not in
> 5.2.17 sources so it needed to be applied conditionally.
> 
> The, only one, patch is
> php-5.2.16-fix-build-when-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch
> and it seems related to an extension (gmp in the name).
> 
> Can someone give me an hint?
> 
> 
> Thank you,
> 
> Best Regards,
> Daniele

Hi Daniele.
Did you move forward with the php bump?
I wouldn't mind dropping the 5.2 series for two reasons:

* We don't need to maintain any compatibility
* Upstream EOL - no more security updates

So i'd say just go forward with 5.3.x...
Regards.
