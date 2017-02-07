From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 7 Feb 2017 10:55:36 +0100
Subject: [Buildroot] [PATCH v2] gst1-imx: add menuconfig to select each
 plugin individually
In-Reply-To: <20170206193740.07f9311e@free-electrons.com>
References: <20160926081559.2062-1-gary.bisson@boundarydevices.com>
 <20170206193740.07f9311e@free-electrons.com>
Message-ID: <CAAMH-yufmR=98PF4tHzJgq6twuU-ibt8BgY5A-spvczACeJkDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Feb 6, 2017 at 7:37 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 26 Sep 2016 10:15:59 +0200, Gary Bisson wrote:
>> Also making it clearer as for what each plugin dependencies are.
>>
>> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>> ---
>> Hi all,
>
> Applied to master, thanks. I've just inverted some of the conditions to
> avoid the empty ifeq ... else statements.

Thanks!

> Please check that the result is OK. Thanks! :-)

I did test the different options and everything looks good.

Regards,
Gary
