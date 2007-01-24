From: Daniel Laird <danieljlaird@hotmail.com>
Date: Wed, 24 Jan 2007 03:37:38 -0800 (PST)
Subject: [Buildroot] [PATCH] Add local directory for non-public packages
In-Reply-To: <20070124001104.GB17761@codepoet.org>
References: <1169593120.5361.17.camel@elrond.sweden.atmel.com>
	<20070124001104.GB17761@codepoet.org>
Message-ID: <8558857.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




Erik Andersen wrote:
> 
> On Tue Jan 23, 2007 at 11:58:40PM +0100, Ulf Samuelsson wrote:
>> This adds a "buildroot/local" directory.
>> The structure of "local" is the same as that of "packages"
>> but the contents of "local" is never
>> intended to be merged upstream.
>> 
>> It allows simple maintenance of those application
>> since you only need to move the local directory from
>> one version of buildroot to a newer.
>> 
>> Best Regards
>> Ulf Samuelsson
> 
> See package/customize/ which tries to do the same thing.
> 
> If you think perhaps package/customize/ should be renamed
> or better documented I'm open to that.  Adding a second
> directory doing the same thing however seems unwise.
> 
> 
>  -Erik
> 
> --
> Erik B. Andersen             http://codepoet-consulting.com/
> --This message was written using 73% post-consumer electrons--
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
> 
I too would be very happy to see this patch go in.  It means buildroot can
be a more generic build system allowing people to easily move from version
to version.  But also allows people to use it to build their own packages
that are not going to be ever part of the open-source world, or are so
specialised as to be of limited use to the main buildroot community.
Dan
-- 
View this message in context: http://www.nabble.com/-PATCH--Add-local-directory-for-non-public-packages-tf3078310.html#a8558857
Sent from the BuildRoot mailing list archive at Nabble.com.
