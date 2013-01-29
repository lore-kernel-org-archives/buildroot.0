From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Jan 2013 18:19:58 -0300
Subject: [Buildroot] [PATCH] olsr: bump to version 0.6.4
In-Reply-To: <87halzd8wm.fsf@dell.be.48ers.dk>
References: <1359468619-12256-1-git-send-email-gustavo@zacarias.com.ar>
 <87halzd8wm.fsf@dell.be.48ers.dk>
Message-ID: <51083CFE.7050009@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/29/2013 05:35 PM, Peter Korsgaard wrote:

>  Gustavo> Switch to forked mode in the init script to avoid console noise.
> 
> Does this mean it needs to depend on BR2_USE_MMU?

Yes, but it's not my fault(tm)!
The previous version wouldn't build on nommu anyway, we just didn't hit
the issue before or i didn't see it since what i changed is just an
invocation parameter of the initscript.
I'll send v2.
Regards.
