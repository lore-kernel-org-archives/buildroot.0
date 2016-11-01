From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 1 Nov 2016 12:08:23 -0200
Subject: [Buildroot] [PATCH] configs/imx28evk: Generate the standard
	sdcard.img
In-Reply-To: <20161101150354.758991a2@free-electrons.com>
References: <1477923118-9395-1-git-send-email-festevam@gmail.com>
 <20161101150354.758991a2@free-electrons.com>
Message-ID: <CAOMZO5DQS3XqJ79Hi1Y8+bzz-x6NKLZy_Mgzem=QKsMknPuyVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 1, 2016 at 12:03 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 31 Oct 2016 12:11:58 -0200, Fabio Estevam wrote:
>
>> diff --git a/board/freescale/imx28evk/readme.txt b/board/freescale/imx28evk/readme.txt
>> index cbf6aae..02fde06 100644
>> --- a/board/freescale/imx28evk/readme.txt
>> +++ b/board/freescale/imx28evk/readme.txt
>> @@ -37,7 +37,7 @@ and copy the bootloader, kernel and root filesystem as needed.
>>
>>  *** WARNING! The script will destroy all the card content. Use with care! ***
>
> This warning (and the paragraph) above it was still referring to a
> "script", but there is not script to run anymore. So I've reworded this
> a bit, and applied.

Thanks for rewording it!
