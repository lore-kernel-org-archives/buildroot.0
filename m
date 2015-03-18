From: Steve Kenton <skenton@ou.edu>
Date: Wed, 18 Mar 2015 12:21:33 -0500
Subject: [Buildroot] [PATCH v3 1/1] tovid: new package
In-Reply-To: <20150318174714.2e552220@free-electrons.com>
References: <1426691741-3961-1-git-send-email-skenton@ou.edu>	<20150318164628.3a84b974@free-electrons.com>	<5509A386.1030107@ou.edu>
 <20150318174714.2e552220@free-electrons.com>
Message-ID: <5509B41D.8040300@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/18/2015 11:47 AM, Thomas Petazzoni wrote:
> Dear Steve Kenton,
> 

> Essentially, anything that isn't obvious generally needs a comment
> somewhere :-)
Understood
> 
>>>> +TOVID_SITE = http://tovid.googlecode.com/svn/trunk/tovid
>>>
>>> Google Code is closing. Is there a better location for this project? Or
>>> is the project planning to move to some other place in the near future ?
>> Did not know that, will investigate.
> 
> Well, I think it's fine for now, the source URL can always be changed
> later when the project moves elsewhere. There have been some changes
> recently (today, yesterday, etc.) so the project seems to be maintained.
Here's what the maintainer had to say in a post yesterday:

"As well google code is shutting down, so I am in process of moving to a
new repo. More news to follow re this."

> 
> BTW, I don't remember if I asked: why would you want to run something
> such as tovid on an embedded system? What's the final use case?
Rack mount video system, records and burns dvds on the fly.

Steve

> 
> Thanks,
> 
> Thomas
> 
