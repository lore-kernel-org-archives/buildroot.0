From: Bernhard Fischer <rep.nop@aon.at>
Date: Thu, 16 Nov 2006 17:37:58 +0100
Subject: [Buildroot] C++ cross compiler
In-Reply-To: <loom.20061115T164509-569@post.gmane.org>
References: <22099.82.171.61.116.1163581168.squirrel@webmail.aerende.com>
	<loom.20061115T152329-249@post.gmane.org>
	<24139.82.171.61.116.1163604033.squirrel@webmail.aerende.com>
	<loom.20061115T164509-569@post.gmane.org>
Message-ID: <20061116163758.GA26680@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 15, 2006 at 03:50:52PM +0000, MikeW wrote:
> <nina.holly@...> writes:
>
>> 
>> Hi Mike,
>>    The build completes without an error, just no
>> arm-linux-g++ compiler gets built.  So I'm not sure
>> if the patch would fix the problem.
>> 
>> Nina
>>
>Must be something more fundamental wrong - you'll have to try (e.g.)

For a native compiler on the target, make sure to set
BR2_PACKAGE_GCC_TARGET=y
