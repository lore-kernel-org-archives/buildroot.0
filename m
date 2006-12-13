From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 13 Dec 2006 20:22:34 +0100
Subject: [Buildroot] Impossible to build EABI ARM gcc
	toolchain?using?Buildroot ?
In-Reply-To: <loom.20061213T123854-410@post.gmane.org>
References: <loom.20061129T130728-811@post.gmane.org>
	<1164848869.23643.60.camel@dv>
	<loom.20061130T112254-849@post.gmane.org>
	<1164960699.4870.67.camel@dv>
	<loom.20061213T123854-410@post.gmane.org>
Message-ID: <20061213192233.GA23970@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 13, 2006 at 12:08:41PM +0000, MikeW wrote:
>Pavel Roskin <proski@...> writes:
>> There are already patches for gcc in buildroot that change
>> TARGET_LINKER_EMULATION for bigendian systems and uClibc.  I think
>> support for EABI belongs there too.
>> 
>
>So how do we get these included into Buildroot ?

Someone who knows arm writes, tests and applies them. I don't do
arm (don't have a board and don't intend to play with an emulated
one, fwiw), sorry.
