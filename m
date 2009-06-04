From: nickich <nickich@abv.bg>
Date: Thu, 4 Jun 2009 07:40:24 -0700 (PDT)
Subject: [Buildroot] switch_root...
In-Reply-To: <87ab4oysjz.fsf@macbook.be.48ers.dk>
References: <23869987.post@talk.nabble.com>
	<87ab4oysjz.fsf@macbook.be.48ers.dk>
Message-ID: <23871331.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




Peter Korsgaard-3 wrote:
> 
>>>>>> "nickich" == nickich  <nickich@abv.bg> writes:
> 
>  nickich> Hi,
> 
>  nickich> When I use switch_root I have an error "not rootfs", which
>  nickich> comes from the condition !S_ISREG(st1.st_mode). When I
>  nickich> remove this condition, all seems to work fine (or at least I
>  nickich> think so).
> 
>  nickich> What is this check for? 
>  nickich> Can it be removed safely? 
>  nickich> What's wrong with my system to break here?
> 
> Are you talking about the busybox switch_root applet? If so, then
> better ask on the busybox list (busybox at busybox.net).
> 
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 

Yes, I mean busybox.
Thanks!
-- 
View this message in context: http://www.nabble.com/switch_root...-tp23869987p23871331.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
