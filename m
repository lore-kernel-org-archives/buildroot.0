From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 7 May 2017 22:41:09 +0200
Subject: [Buildroot] [PATCH v3 0/5] Runtime testing infrastructure
In-Reply-To: <20170507220901.4000ec8e@free-electrons.com>
References: <1490042214-6762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170507220901.4000ec8e@free-electrons.com>
Message-ID: <8b9222c3-8547-fe79-09dc-288553b2a9e2@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 07/05/2017 22:09, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 20 Mar 2017 21:36:49 +0100, Thomas Petazzoni wrote:
> 
>> Thomas Petazzoni (5):
>>   support/testing: core testing infrastructure
>>   support/testing: add core tests
>>   support/testing: add fs tests
>>   support/testing: add package tests
>>   support/testing: add toolchain tests
> 
> Since this has been around for a long time, I've finally applied this
> series.

Bad timing on my side: I was reviewing all this work in detail a couple
of days ago, but my reviews to 2 patches are in my drafts folder waiting
for the remaining ones... Ok, I'll send them anyway right noe as a list
of proposed improvements.

> I know Luca, Ricardo and Thomas DS had some comments, but I believe it
> would be easier to address them as follow-up patches. So Luca, Ricardo,
> Thomas, your patches to improve this testing infrastructure are more
> than welcome. I'm sure it needs to be extended and improved in many
> different ways to test more Buildroot functionalities.

I totally agree this is the best way to proceed. Now everybody can
easily send small, incremental patches to improve the work. Thanks for
having applied these patches.

Any plan to have the tests run automatically (on the autobuilders maybe)?

-- 
Luca
