From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 4 Sep 2020 13:55:17 +0100
Subject: [Buildroot] [PATCH 2/3] package/libcamera: Update requirements
 for C++17
In-Reply-To: <20200904145105.6cf2e0c1@windsurf.home>
References: <20200904095148.844292-1-kieran.bingham@ideasonboard.com>
 <20200904095148.844292-3-kieran.bingham@ideasonboard.com>
 <20200904145105.6cf2e0c1@windsurf.home>
Message-ID: <dac2b203-377a-44fb-85ab-4b9ed9cc7b34@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 04/09/2020 13:51, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri,  4 Sep 2020 10:51:46 +0100
> Kieran Bingham <kieran.bingham@ideasonboard.com> wrote:
> 
>> The libcamera project has moved to C++17. Update the toolchain
>> requirements accordingly.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Is this fixing some specific autobuilder failure ? If so, do you have a
> reference ?

No, that's a pre-requisite for patch 3/3.

libcamera is now built with C++17 as a minimum requirement.

> Thanks!
> 
> Thomas

-- 
Regards
--
Kieran
