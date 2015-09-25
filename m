From: Gergely Imreh <imrehg@gmail.com>
Date: Fri, 25 Sep 2015 11:27:37 +0800
Subject: [Buildroot] [PATCH] package/genimage: bump version to 8
In-Reply-To: <20150924173413.GA30676@ketchup.mtl.sfl>
References: <1443086443-107037-1-git-send-email-benoit@wsystem.com>
 <5603C18F.5040008@wsystem.com> <20150924173413.GA30676@ketchup.mtl.sfl>
Message-ID: <CAJ3iQco1tHwrFvKSCtAcjTTER00SJdQDtS9621s6KOJ7QzjhaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested-by: Gergely Imreh <imrehg@gmail.com>
  by running "make wandboard_defconfig && make" as it uses genimage.
Confirm fixed previous segfault on x86_64

On 25 September 2015 at 01:34, Vivien Didelot
<vivien.didelot@savoirfairelinux.com> wrote:
> On Sep. Thursday 24 (39) 11:25 AM, Beno?t Th?baudeau wrote:
>> On 24/09/2015 11:20, Beno?t Th?baudeau wrote:
>> > This new version fixes segmentation faults on some platforms.
>> >
>> > Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
>
> Reviewed-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Tested-by: Gergely Imreh <imrehg@gmail.com>
  by running "make wandboard_defconfig && make" as it uses genimage.
Confirm fix of previous segfault on x86_64
