From: Andre <armcc2000@yahoo.com>
Date: Mon, 11 Dec 2006 23:32:53 -0800 (PST)
Subject: [Buildroot] ARM softfloat patch for gcc 4.2
In-Reply-To: <20061210141537.GD4442@aon.at>
Message-ID: <406186.89354.qm@web35612.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer <rep.nop@aon.at> wrote:
> On Fri, Dec 08, 2006 at 07:21:14PM -0800, Andre wrote:
> >Tested with gcc 4.2 20061205 snapshot + binutils 2.17
> >
> >Seems to work with one minor issue: although the newly created
> >arm-linux-uclibc-gcc defaults to -mfloat-abi=soft, binutils does
> not.
> 
> There are (at least) two upstream bugs about arm softfloat:
> gcc.gnu.org/PR16314
> gcc.gnu.org/PR14352
> 
> Richard is the arm arch maintainer, so please discuss the problems
> there and also fix it there. thanks,
> 

Not quite sure I follow you... the issue with binutils seems likely
to be in binutils or in the way buildroot configures and builds
binutils, or not ??

The gcc bugs you reference seem to be unrelated...

Anyway, does the rest of the patch look OK ?? (There should be
nothing too controversial in there, I just updated an existing
buildroot patch for gcc so that it applies to the latest gcc 4.2
snapshot).

Andre
--



 
____________________________________________________________________________________
Do you Yahoo!?
Everyone is raving about the all-new Yahoo! Mail beta.
http://new.mail.yahoo.com
