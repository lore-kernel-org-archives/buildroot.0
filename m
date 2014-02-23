From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 23 Feb 2014 15:35:37 +0100
Subject: [Buildroot] [PATCH] manual: Add a note for dependency comment
	format
In-Reply-To: <20140223150456.78a2b2ce@skate>
References: <1393160748-14235-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20140223150456.78a2b2ce@skate>
Message-ID: <CAGduivyrc0Gk92pbS=-0TLSp4xWDnV54hz1mzH-ixvHCD1hOrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all
On Sun, Feb 23, 2014 at 3:04 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Maxime Hadjinlian,
>
> On Sun, 23 Feb 2014 14:05:48 +0100, Maxime Hadjinlian wrote:
>> Add a quick note to clarify that the format of the depencency comments
>> applies irregardless of the number of dependencies.
>>
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> ---
>>  docs/manual/adding-packages-directory.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
>> index 3dc5395..b6dc981 100644
>> --- a/docs/manual/adding-packages-directory.txt
>> +++ b/docs/manual/adding-packages-directory.txt
>> @@ -205,6 +205,7 @@ aircrack-ng needs a toolchain w/ largefile, threads
>>
>>  Note that this text is kept brief on purpose, so that it will fit on a
>>  80-character terminal.
>> +This format must be repected even if there is only one dependency.
>
> I'm not sure what you mean here. Could you explain a bit more?
The examples always give with n depedency. Someone may ask himself if
this format is valid for only one depedency.
Should it reduce the with to w/, etc...
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
