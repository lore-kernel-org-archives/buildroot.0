From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Fri, 26 Aug 2016 14:32:47 +0530
Subject: [Buildroot] [PATCH 1/1] domoticz: fix build with uClibc
In-Reply-To: <20160826105648.65579c15@free-electrons.com>
References: <1472144466-17003-1-git-send-email-rahul.bedarkar@imgtec.com>
 <878tvkecij.fsf@dell.be.48ers.dk>
 <20160826105648.65579c15@free-electrons.com>
Message-ID: <57C005B7.9090306@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Friday 26 August 2016 02:26 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 25 Aug 2016 23:59:00 +0200, Peter Korsgaard wrote:
>
>>   > Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
>>
>> Committed, thanks.
>
> And actually I had to fix up the patch, because it was not applying
> properly. See
> https://git.buildroot.org/buildroot/commit/?id=397962ce1737ba0f920ffc1d3a3ea2bc08b28270
> for all the details.
>
> Rahul, did you actually test the patch? It didn't apply to the domoticz
> source code extracted from the tarball, causing an immediate build
> failure.
>

Yes, I had tested patch. It was applied cleanly in my case. Not sure why 
it hasn't failed for me.

Thanks for fix.

Regards,
Rahul
