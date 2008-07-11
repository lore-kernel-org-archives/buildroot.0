From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Fri, 11 Jul 2008 09:15:44 +0200
Subject: [Buildroot] uClibc missing limits.h
In-Reply-To: <20080709113845.GB27321@mx.loc>
References: <485F9581.2040204@cetrtapot.si> <486B4357.8060908@cetrtapot.si>
	<3E421C7434714D94B87F0D1F52CDEA8D@aeglos>
	<486C7A22.8000604@cetrtapot.si> <20080703080557.GA29943@mx.loc>
	<48746EC3.2020008@cetrtapot.si> <20080709113845.GB27321@mx.loc>
Message-ID: <487708A0.4000308@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Wed, Jul 09, 2008 at 09:54:43AM +0200, Hinko Kocevar wrote:
>> Bernhard Fischer wrote:
>>> On Thu, Jul 03, 2008 at 09:05:06AM +0200, Hinko Kocevar wrote:
> 
>>>>> Removing "-nostdinc" from CFLAGS in "uClibc-0.9.29/Rules.mak"
>>>>> allows the ARM compilation to continue,
>>>> But is this OK?
>>> no.
>> Looking at the gcc manual "-nostdinc" causes compiler to omit the standard include directories:
> 
>> Or we could use "-isystem" flag:
> 
> No, better pull the fix that we have in uClibc-trunk, short of using the
> trunk in the first place.
> 

Nice.

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
