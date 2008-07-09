From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 9 Jul 2008 13:38:45 +0200
Subject: [Buildroot] uClibc missing limits.h
In-Reply-To: <48746EC3.2020008@cetrtapot.si>
References: <485F9581.2040204@cetrtapot.si> <486B4357.8060908@cetrtapot.si>
	<3E421C7434714D94B87F0D1F52CDEA8D@aeglos>
	<486C7A22.8000604@cetrtapot.si> <20080703080557.GA29943@mx.loc>
	<48746EC3.2020008@cetrtapot.si>
Message-ID: <20080709113845.GB27321@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 09, 2008 at 09:54:43AM +0200, Hinko Kocevar wrote:
>Bernhard Fischer wrote:
>> On Thu, Jul 03, 2008 at 09:05:06AM +0200, Hinko Kocevar wrote:

>>>> Removing "-nostdinc" from CFLAGS in "uClibc-0.9.29/Rules.mak"
>>>> allows the ARM compilation to continue,
>>> But is this OK?
>> 
>> no.
>
>Looking at the gcc manual "-nostdinc" causes compiler to omit the standard include directories:

>Or we could use "-isystem" flag:

No, better pull the fix that we have in uClibc-trunk, short of using the
trunk in the first place.

>PS.: Now I know what -I=dir stands for :)

heh ;)
