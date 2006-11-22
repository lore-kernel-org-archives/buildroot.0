From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 22 Nov 2006 21:32:32 +0100
Subject: [Buildroot] Error compiling svn revision 16633.
In-Reply-To: <33540.80.176.236.13.1164227129.squirrel@mail.primefarm.co.uk>
References: <1d09f8b80611221150j5f12383fl1f4cb914f9c0d733@mail.gmail.com>
	<20061122200454.GC1863@aon.at>
	<33540.80.176.236.13.1164227129.squirrel@mail.primefarm.co.uk>
Message-ID: <20061122203232.GB2626@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 22, 2006 at 08:25:29PM -0000, lists at primefarm.co.uk wrote:
>
>
>
>On Wed, November 22, 2006 8:04 pm, Bernhard Fischer wrote:
>> On Wed, Nov 22, 2006 at 02:50:42PM -0500, Will Buik wrote:
>>
>>> I used svn to checkout the latest revision 16632 and set up default
>>> configuration with make menuconfig, but when trying to compile I
>>> immidatly get the error: target/cpio/cpioroot.mk:10: *** missing
>>> separator.  Stop.
>>
>> oh well. Fixed. Thanks for pointing this out.
>> _______________________________________________
>> buildroot mailing list buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>>
>>
>
>
>A clean install now gives the following error:
>
>target/cpio/cpioroot.mk:13: *** missing separator.  Stop.

Goetz Bock's patch had damaged whitespace that i didn't spot.
Fixed now, sorry.
