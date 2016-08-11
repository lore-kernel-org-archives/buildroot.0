From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Thu, 11 Aug 2016 11:06:55 +0530
Subject: [Buildroot] [PATCH 2/2] mtd: integck needs MMU support
In-Reply-To: <20160810223708.0ab57981@free-electrons.com>
References: <1470847117-14956-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1470847117-14956-2-git-send-email-rahul.bedarkar@imgtec.com>
 <20160810223708.0ab57981@free-electrons.com>
Message-ID: <57AC0EF7.2010401@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thursday 11 August 2016 02:07 AM, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 10 Aug 2016 22:08:37 +0530, Rahul Bedarkar wrote:
>> After fixing build issue related to MS_DIRSYNC and MS_RELATIME, we get
>> following build error with blackfin external toolchain.
>
> So it is really worth the effort merging PATCH 1/2 ?

I'm not completely sure, but I think we should merge PATCH 1/2 because 
it fixes different issue and this patch just hides that issue for 
blackfin external toolchain.

Thanks,

Rahul
