From: Andreas Naumann <dev@andin.de>
Date: Wed, 27 Mar 2019 23:09:44 +0100
Subject: [Buildroot] [PATCH v4 2/6] qt5: Provide generic qmake package
 infrastructure
In-Reply-To: <e5be61b9-45e1-ddea-2b8a-9ba7511383b3@mind.be>
References: <20190322183904.22401-1-anaumann@ultratronik.de>
 <20190322183904.22401-3-anaumann@ultratronik.de>
 <e5be61b9-45e1-ddea-2b8a-9ba7511383b3@mind.be>
Message-ID: <d5dfca80-36da-5f4c-21de-e28b942217c9@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 26.03.19 um 00:16 schrieb Arnout Vandecappelle:
> Hi Andreas,
> 
> On 22/03/2019 19:39, Andreas Naumann wrote:
>> This provides generic functions for Qt5 qmake based packages. 
>> Besides being able to remove lots of redundant commands, it should 
>> make it possible to eliminate the numerous and complex target 
>> install steps.
> 
> The commands are not really redundant (otherwise you could just 
> remove them

I guess I used the wrong word, should be duplicate instead of redundant.

> anyway) and eliminating the target install steps is more or less the 
> same thing.

Yes and no. Target install is done in another way, so why not summarize
that?

> And anyway, this infra doesn't allow that by itself, because you 
> could just do it per package. It just makes it easier to do it 
> consistently for all packages, makes it easier to add a new qmake 
> package, and it makes it easier to change how the target
> installation is done.

True, it's two things at once. I'll split the patch and add your
statements about consistency. More on this in my answer further down the
thread.


regards,
Andreas


> snip
> 
