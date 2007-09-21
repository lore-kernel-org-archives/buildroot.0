From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 21 Sep 2007 11:39:27 +0200
Subject: [Buildroot] [buildroot 0001474]: toolchain build, arch x86_64	,
	variant core2 does not build
In-Reply-To: <e83232070709120440s27c1df9ai606b5b64626d8f66@mail.gmail.com>
References: <6a159fc7ac57e67bc6483273eb8d8d2d@busybox.net>
	<e83232070709120440s27c1df9ai606b5b64626d8f66@mail.gmail.com>
Message-ID: <20070921093927.GE24467@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 12, 2007 at 09:40:54PM +1000, Roderick Taylor wrote:
>On 08/09/2007, bugs at busybox.net <bugs@busybox.net> wrote:
>> ----------------------------------------------------------------------
>>  bernhardf - 09-07-07 11:55
>> ----------------------------------------------------------------------
>> See ML archives for the correct solution (default core2 if
>> !GCC_VERSION_THIS && !GCC_VERSION_THAT; gcc-4.3 does support -mtune=core2
>> just fine, so the proposed solution is not correct).
>>
>
>Is this patch close to what you had in mind?

Well, I'm more inclined to special-case the broken compilers and not the
working ones, given that all the new versions will support this from now
on, as opposed to the old ones.
