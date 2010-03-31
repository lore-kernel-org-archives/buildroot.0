From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 31 Mar 2010 13:58:58 -0500
Subject: [Buildroot] init segfaults when compiled with glibc
In-Reply-To: <4BB3944D.2080301@browserseal.com>
References: <4BB20A06.1090407@browserseal.com>	<4BB2794A.3030400@free.fr>
	<j2i478c82f01003310718gbaf125f7t382a3dd8ac5b3823@mail.gmail.com>
	<hovmml$391$1@dough.gmane.org>
	<x2g478c82f01003310848x8e42f326v263e14193e0972a6@mail.gmail.com>
	<87mxxo8ipp.fsf@macbook.be.48ers.dk> <4BB3944D.2080301@browserseal.com>
Message-ID: <0D753D10438DA54287A00B02708426976369248B23@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, March 31, 2010 11:28 AM, Sasha Sirotkin wrote:
> Peter Korsgaard wrote:
>>>>>>> "Alexander" == Alexander (Sasha) Sirotkin <buildroot@browserseal.com> writes:
>>>>>>>             
>>
>>  Alexander> I did not manage to compile crosstoll-ng with eglibc yet. It
>>  Alexander> looks like eglibc support is broken in crosstool-ng and
>>  Alexander> glibc support is broken in buildroot.
>>
>> uClibc? We don't have glibc support (except for external toolchains), so
>> it cannot really be broken ;)
>>
>>   
> Well... it is broken in a sense that buildroot does not work with an 
> external toolchain based on glibc. Please see above.

FWIW, I'm using an external glibc toolchain (created with crosstoo-NG)
with no problems.

Regards,
Hartley
