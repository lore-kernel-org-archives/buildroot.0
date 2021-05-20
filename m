From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 20 May 2021 02:14:12 +0200
Subject: [Buildroot] [PATCH 2/2] package/lvm2: drop
 BR2_PACKAGE_LVM2_APP_LIBRARY
In-Reply-To: <99074531-f77a-1e83-0acb-7fbf45c0e07c@benettiengineering.com>
References: <20210517170609.810302-1-fontaine.fabrice@gmail.com>
 <20210517170609.810302-2-fontaine.fabrice@gmail.com>
 <20210517204324.GH2506@scaer>
 <CAPi7W83SZL9j2iEvi8DM6EBVJfXksN5-WsGZXnSundeHfYHOYA@mail.gmail.com>
 <8bce0504-8c29-5868-bd66-c998ece91eae@benettiengineering.com>
 <46aee4a7-5baf-49b5-889a-aaead48f5501@benettiengineering.com>
 <20210518091905.GO2506@scaer>
 <99074531-f77a-1e83-0acb-7fbf45c0e07c@benettiengineering.com>
Message-ID: <76360870-2bee-a52a-c5c1-b9dc6c3dfcf8@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 5/18/21 11:54 AM, Giulio Benetti wrote:
> Hi Yann, All,
> 
> On 5/18/21 11:19 AM, Yann E. MORIN wrote:
>> IIRC, there was some back-n-forth on IRC about various technical
>> details, like NLS handling and use of msgfmt:
>>       http://lists.busybox.net/pipermail/buildroot/2020-July/287917.html
>>       http://lists.busybox.net/pipermail/buildroot/2020-August/290568.html
> 

I've just sent the udisks' patch. Regarding this:
http://lists.busybox.net/pipermail/buildroot/2020-August/290568.html

it seems something not related to udisks.

I've built with test-pkg succesfully while now I've launched test-pkg -a 
to build with all architectures.

Since I've started, then Adam continued and then I've finished how does 
it work with authorship? Is it mine? And also, I should add its SoB with
listing what I've done and he's done, right? If so I will send on V2.

Thank you
and
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
