From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 7 Oct 2009 08:41:44 +0200
Subject: [Buildroot] [PATCH 5/6] mark odd strip invocations
In-Reply-To: <20091006220135.65f111f4@coruscant.lan>
References: <1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
	<4a5a0f10dbaecfd7b024c0cf1e90fd68a6730eac.1254853146.git.rep.dot.nop@gmail.com>
	<6fe0ac8fa1f42152f604ca708aff08b8f119073a.1254853146.git.rep.dot.nop@gmail.com>
	<582a63d745311a980a8700a2a0ec17c3ae0f5ca9.1254853146.git.rep.dot.nop@gmail.com>
	<cover.1254853146.git.rep.dot.nop@gmail.com>
	<5959e530273437a31071499009cecc7a7e9ab461.1254853146.git.rep.dot.nop@gmail.com>
	<87eipg2wxc.fsf@macbook.be.48ers.dk>
	<20091006184241.GB10261@mx.loc>
	<87skdw1hlr.fsf@macbook.be.48ers.dk>
	<20091006220135.65f111f4@coruscant.lan>
Message-ID: <20091007064144.GE10261@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 06, 2009 at 10:01:35PM +0200, Olaf Rempel wrote:
>On Tue, 06 Oct 2009 20:51:12 +0200
>Peter Korsgaard <jacmet@uclibc.org> wrote:
>
>> >>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
>> 
>> Hi,
>> 
>>  Bernhard> +	# huhu? STRIP_STRIP_UNNEEDED
>>  >> 
>>  >> Please just fix stuff instead of adding questions in comments.
>> 
>>  Bernhard> People should be made aware of stuff like that. Did the .so
>>  Bernhard> work at all if you stripped all (instead of only unneeded)?
>> 
>> Sure, but stuff should get fixed instead. I have no idea if it worked,
>> never used ntfs3g - Olaf?
>
>Yep, it works 100%.
>Target is a i586 automated partition-imaging tool build with gcc 4.3.3, 
>binutils 2.19.1, uclibc 0.9.31.1 and using BR2_STRIP_sstrip (if that matters).

that matters indeed; sstrip doesn't use any such flags as opposed to
strip.
