From: Steve Kenton <skenton@ou.edu>
Date: Thu, 19 Mar 2015 10:29:32 -0500
Subject: [Buildroot] [PATCH v3 1/1] tovid: new package
In-Reply-To: <20150319091719.0dddb2e4@free-electrons.com>
References: <1426691741-3961-1-git-send-email-skenton@ou.edu>	<20150318164628.3a84b974@free-electrons.com>	<5509A386.1030107@ou.edu>	<20150318174714.2e552220@free-electrons.com>	<5509B41D.8040300@ou.edu>
 <20150319091719.0dddb2e4@free-electrons.com>
Message-ID: <550AEB5C.4090606@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/19/2015 03:17 AM, Thomas Petazzoni wrote:
> Dear Steve Kenton,
> 
> On Wed, 18 Mar 2015 12:21:33 -0500, Steve Kenton wrote:
> 
>>> Well, I think it's fine for now, the source URL can always be changed
>>> later when the project moves elsewhere. There have been some changes
>>> recently (today, yesterday, etc.) so the project seems to be maintained.
>> Here's what the maintainer had to say in a post yesterday:
>>
>> "As well google code is shutting down, so I am in process of moving to a
>> new repo. More news to follow re this."
> 
> Ok, good. So we can use Google Code for now, and we'll switch to the
> new location once it becomes available.
> 
>>> BTW, I don't remember if I asked: why would you want to run something
>>> such as tovid on an embedded system? What's the final use case?
>> Rack mount video system, records and burns dvds on the fly.
> 
> Cool! Is this some public product? Or will it be public at some point?
Well, since you asked .... http://bcdusa.com/bcd-dvd-1150/hdi-250
Several pre-production units have gone out to users of previous generation equipment.
This is our first GPL based product - it ships will full source to the buildroot
based "BCD Linux Distribution" (which we refer to as bcdist) along with scripts to
download and build from scratch too. The hardware can do 4K video and 24-bit 16
channel audio so we have plans for a number of enhanced versions - later :-) I've
been trying to push stuff back upstream so we don't have to carry many (any?) patches
to the GPL components of the system.

Steve


>  
> Best regards,
> 
> Thomas
> 
