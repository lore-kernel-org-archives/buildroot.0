From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 23 Sep 2014 21:41:59 +0200
Subject: [Buildroot] Pending "big" patch series
In-Reply-To: <20140923200255.1be119c9@free-electrons.com>
References: <20140914125321.0d68b842@free-electrons.com>
 <20140923200255.1be119c9@free-electrons.com>
Message-ID: <118eb205-f24c-4a63-bb39-01e7bbba8139@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> schreef:
>Hello,
>
>A quick status on those big patch series.
>
>On Sun, 14 Sep 2014 12:53:21 +0200, Thomas Petazzoni wrote:
>
>>  * gendoc infra: make it useable for other documents (18 patches)
>>    http://lists.busybox.net/pipermail/buildroot/2014-September/105678.html
>> 
>>    I'm personally not highly interested in making the gendoc infra
>>    suitable for other documents than the manual, so I'm not very
>>    motivated to review this. But maybe other persons are interested,
>>    especially Samuel or Thomas DS who have followed the gendoc changes?
>
>I've applied PATCH 1, but I've raised concerns on PATCH 2.

I'm in the process of reviewing this, but due to time constraints the review is split over many days...

>>  * CMake cleanup (5 patches)
>>    http://lists.busybox.net/pipermail/buildroot/2014-August/104794.html
>> 
>>    Needs review.
>
>No change, still needs review.

Who, besides Samuel himself, has experience with cmake and is willing to review this? It would be a great help to the community, so please step up!

>
>>  * packages: rename _OPT into _OPTS (2 patches)
>>    http://lists.busybox.net/pipermail/buildroot/2014-July/103082.html
>> 
>>    Thomas DS, could you respin this patch series?
>
>Thomas ?

Yes, this is on my list, right after the ongoing review of Yann's patches...

Best regards,
Thomas
