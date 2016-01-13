From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Wed, 13 Jan 2016 08:31:43 +0200 (IST)
Subject: [Buildroot] [PATCH 1/1 v3] ypbind-mt: new package
In-Reply-To: <569579C5.1010409@mind.be>
References: <1452516304-6029-1-git-send-email-yba@tkos.co.il>
 <569579C5.1010409@mind.be>
Message-ID: <alpine.DEB.2.11.1601130827550.11251@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Jan 2016, Arnout Vandecappelle wrote:

> Date: Tue, 12 Jan 2016 23:10:13 +0100
> From: Arnout Vandecappelle <arnout@mind.be>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>, buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 1/1 v3] ypbind-mt: new package
> 
> Hi Jonathan,
>
> On 11-01-16 13:45, Jonathan Ben-Avraham wrote:
>> From: Jonathan Ben Avraham <yba@tkos.co.il>
>>
>> This patch adds the ypbind-mt package that contains a multithreaded
>> ypbind daemon for Linux. It uses threads for better response and
>> supports the ypbind protocols version 1, 2 and 3. ypbind finds the
>> server for a given NIS domain and stores information about it in a
>> binding file on the local host.
>>
>
> You Sob should go here, before the ---

Hi Arnout,
I do not understand this comment. Please provide further explanation.

>
>> ---
>> This patch is a complete rework of the previous patches submitted by
>> the author for the ypbind-mt package in December 2015. The main
>> difference between this version and the previous version is the
>> dependency on a glibc toolchain and the Kconfig comment to this effect.

[snip]

  - yba


-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
