From: Ryan Coe <bluemrp9@gmail.com>
Date: Sun, 07 Dec 2014 14:56:15 -0800
Subject: [Buildroot] [PATCH 1/1] lighttpd: install fastcgi config for php
In-Reply-To: <20141207235043.01177f0c@free-electrons.com>
References: <1417559724-25091-1-git-send-email-bluemrp9@gmail.com>
 <20141207235043.01177f0c@free-electrons.com>
Message-ID: <5484DB0F.5070300@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Floris, All,

On 12/07/2014 02:50 PM, Thomas Petazzoni wrote:
> Dear Ryan Coe,
>
> On Tue,  2 Dec 2014 14:35:24 -0800, Ryan Coe wrote:
>> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
>> ---
>>   package/lighttpd/fastcgi.conf |  7 +++++++
>>   package/lighttpd/lighttpd.mk  | 11 +++++++++++
>>   2 files changed, 18 insertions(+)
>>   create mode 100644 package/lighttpd/fastcgi.conf
> Seeing the feedback from Floris Bos on this patch, I marked your patch
> as 'Rejected' in our patch tracking system. Please work with Floris on
> a variant of your patch that takes into account also his use case
> (maybe by making the fastcgi installation optional?).
>
> Thanks!
>
> Thomas

Yes, of course.  This makes sense.
