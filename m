From: Bernhard Fischer <rep.nop@aon.at>
Date: Mon, 18 Dec 2006 13:15:26 +0100
Subject: [Buildroot] Impossible to build EABI ARM gcc
	toolchain?using?Buildroot ?
In-Reply-To: <loom.20061218T123140-410@post.gmane.org>
References: <loom.20061129T130728-811@post.gmane.org>
	<1164848869.23643.60.camel@dv>
	<loom.20061214T103502-915@post.gmane.org>
	<loom.20061218T123140-410@post.gmane.org>
Message-ID: <20061218121526.GA6403@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 18, 2006 at 11:37:11AM +0000, MikeW wrote:
>MikeW <mw_phil@...> writes:
>
>> 
>> Pavel Roskin <proski <at> ...> writes:
>> 
>> > Maybe you can fix it.  You can try another compiler.
>> 
>> Unfortunately, Buldroot gcc-4.1.1 which includes ARM EABI support won't build
>> the 2.6.10 kernel we are using - fails in the get_user macro in uaccess.h.
>> 
>> Patch that, something else breaks in a similar way due to the compiler
>> breaking code that worked under gcc-3.4.x (it needs a switch to turn this off!)
>> 
>> The joys of bazaar development - grrr !
>> 
>> Regards,
>> MikeW
>> 
>
>Looks like the only 3.4.x version of GCC is the one from CodeSourcery,
>http://www.codesourcery.com/gnu_toolchains/arm/releases.html
>I think one of the older ones is derived from a 3.4.x GCC.
>
>Was considering doing a Buildroot config.in patch to get the tar.bz2 file from
>the CS website, but unfortunately the files are returned in response
>to a form submission :(

huh?
http://www.codesourcery.com/public/gnu_toolchain/$target/arm-2006q3-27-$target.src.tar.bz2

for e.g. target=arm-none-eabi

I don't see the problem, really..

Apart from that, it's beyond me why would one want/need to use 2.6.10
