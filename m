From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 25 Feb 2009 06:40:39 +0100
Subject: [Buildroot] problem building openswan using svn-buildroot
References: <499E05A7.2070403@unix-beratung.de><87bpsv6ik4.fsf@macbook.be.48ers.dk><49A17E91.7060104@unix-beratung.de><87y6vy5okv.fsf@macbook.be.48ers.dk><20090223102825.GB31413@cbg.dyndns.org><87hc2l2yns.fsf@macbook.be.48ers.dk><1235456068.24843.35.camel@elrond.atmel.com><87mycc1etl.fsf@macbook.be.48ers.dk><93F12DDAEC3E4BBFBAA4E030667F5EDD@aeglos>
	<87skm3zcvd.fsf@macbook.be.48ers.dk>
Message-ID: <42C9F67C3D4248559AAB9171E4F39305@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
> >> Well - It's HUGE (>7M), but OK, I'll mark it as BROKEN and remove if
> >> after the 2009.05 release unless someone steps up to fix it. I'll also
> >> remove the kernel patches as we remove old kernel versions.
> 
> Ulf> If you feel that the stuff should not be in the svn, then
> Ulf> make the patches loadable and store the patches in the mirror.
> 
> What will that change if it's broken?
> 
> Ulf> As pointed out to you earlier, buildroot users are using
> Ulf> linux-2.6.22 and later so there is no reason to remove things
> Ulf> which is active use.  Again, it makes sense to move the patches
> Ulf> to the mirror, but yuu are the only one to have write acdess as
> Ulf> far as I know.
> 
> Active openswan users? How come we haven't seen any bugreports or
> patches since 2007 then?
> 

No active kernel users.
You indicate that you want to "remove old kernel versions",
and at the moment, I think that there is no need to do this.
It is desirable to make older patches downloadable from the mirror server.

I believe we should do the following for openswan.
* Mark the package as broken in Config
* Move the latest kernel patches to the mirror server.
* Add a comment about this in the Config
* Remove all openswan kernel patches from svn.
Even if someone does not use openswan today, it seems
to be useful and I would like to have some encouragement 
left for people to fix it.


> As said earlier, I think it's absolutely critical to trim the package
> versions between releases, otherwise we'll never be able to get any
> significant testing coverage.
> 
> -- 
> Bye, Peter Korsgaard
>


Best Regards
Ulf Samuelsson 
