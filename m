From: Paul Jones <paul.jones@iwtech.com.au>
Date: Mon, 26 Jan 2009 10:52:47 +1100
Subject: [Buildroot] 2009.02-rc2 released
In-Reply-To: <1232922252.2298.34.camel@elrond.atmel.com>
References: <3B941116898CDA489B91563DEF88F4B607F8DB@iwt-server.iwt.local>	
	<1232868757.5311.170.camel@elrond.atmel.com>	
	<87zlhffs9j.fsf@macbook.be.48ers.dk>	
	<1232918236.2298.9.camel@elrond.atmel.com>	
	<8763k3dqi3.fsf@macbook.be.48ers.dk>
	<1232922252.2298.34.camel@elrond.atmel.com>
Message-ID: <497CFB4F.2010402@iwtech.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
>
> Now it works, regardless if you have X or not.
> so we and the user do not have to choose.
>
> If X is available you have a better experience.
>   

I should just point out that my build system is a Gentoo64 server via 
SSH, my desktop is usually Windows. I'd much prefer to use X myself but 
don't relay have a choice.
>
>   
> If you want to ensure that people has to spend tons of time, 
> updating the config file to fit their desires
> every time they download the trunk, again, I am against that.
>
> IMO, the submitted solution should meet all valid concerns.
>   

As a newbie here I tend to need as much help as I can get! When the 
build crashed and complained about QT missing I thought I'd accidentally 
added some X package into buildroot, it was only after a few hours of 
doing step by step builds that I figured out it must have been running 
xconfig rather than menuconfig. Once I disabled the kernel it compiled 
first go, which is still a lot further than I got when I first tried 
buildroot a few months ago!

Keep up the good work guys!



Paul.
