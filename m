From: Nicolae T <microvis@cox.net>
Date: Fri, 11 Dec 2009 10:07:59 -0800
Subject: [Buildroot] u-boot compile error
In-Reply-To: <B683F7F8E0BC46E5816B5E39B9B101B3@apexjs>
References: <B683F7F8E0BC46E5816B5E39B9B101B3@apexjs>
Message-ID: <1260554879.12496.3.camel@RoadRunner>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Johan,

Maybe that's the case. However since we're building for an arm
cortex-A8, we have to use gcc >= 4.4.x, based on instructions in
menuconifg.



On Fri, 2009-12-11 at 14:37 +0100, Sagaert Johan wrote:
> Hi
>  
> You are using the 4.4.x GCC , the 4.3.x does not cause that error
>  
> Just change the inline declared functions.
> As i remember removing the inline keyword fixes it.
>  
> Johan
>  
>  
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
