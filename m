From: lists at primefarm.co.uk <lists@primefarm.co.uk>
Date: Wed, 22 Nov 2006 20:25:29 -0000 (UTC)
Subject: [Buildroot] Error compiling svn revision 16633.
In-Reply-To: <20061122200454.GC1863@aon.at>
References: <1d09f8b80611221150j5f12383fl1f4cb914f9c0d733@mail.gmail.com>
	<20061122200454.GC1863@aon.at>
Message-ID: <33540.80.176.236.13.1164227129.squirrel@mail.primefarm.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




On Wed, November 22, 2006 8:04 pm, Bernhard Fischer wrote:
> On Wed, Nov 22, 2006 at 02:50:42PM -0500, Will Buik wrote:
>
>> I used svn to checkout the latest revision 16632 and set up default
>> configuration with make menuconfig, but when trying to compile I
>> immidatly get the error: target/cpio/cpioroot.mk:10: *** missing
>> separator.  Stop.
>
> oh well. Fixed. Thanks for pointing this out.
> _______________________________________________
> buildroot mailing list buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>


A clean install now gives the following error:

target/cpio/cpioroot.mk:13: *** missing separator.  Stop.
