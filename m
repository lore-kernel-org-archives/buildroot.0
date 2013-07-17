From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Jul 2013 13:03:56 -0300
Subject: [Buildroot] [PATCH] arch/arm: add support for thumb(1) mode
In-Reply-To: <20130717175838.2fc2831e@skate>
References: <1374075555-9599-1-git-send-email-gustavo@zacarias.com.ar>
 <20130717175838.2fc2831e@skate>
Message-ID: <51E6C06C.8070300@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/17/2013 12:58 PM, Thomas Petazzoni wrote:

> I think this is misleading: Thumb doesn't allow to mix 16 bits and 32
> bits instructions like Thumb2 does. IIRC, with Thumb, a particular
> function needs to be either completely Thumb (16 bits) or completely
> ARM (32 bits), and there is the thumb-interworking mechanism between
> the two.
> 
> Which leads me to this question: is adding Thumb support as simple as
> what you're adding? Aren't there some additional thumb-interworking
> complexities to handle?

http://infocenter.arm.com/help/topic/com.arm.doc.ihi0042e/IHI0042E_aapcs.pdf
Section 5.6 is of interest, once OABI (APCS) was dropped interworking
isn't that hard since it's mandatory for AAPCS.
Regards.
