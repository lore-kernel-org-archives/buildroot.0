From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 14 Oct 2008 11:30:49 +0200
Subject: [Buildroot] grub: bad url
In-Reply-To: <20081014085648.GA25625@cloud.net.au>
References: <88372fcb0810140130xd44cdecwbe573285f4ef4b3c@mail.gmail.com>
	<20081014085648.GA25625@cloud.net.au>
Message-ID: <20081014093049.GD17766@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 14, 2008 at 07:56:49PM +1100, Hamish Moffatt wrote:
>On Tue, Oct 14, 2008 at 10:30:57AM +0200, Daniel Lerch wrote:
>> Hi,
>> 
>> Grub don't work because the url:
>> 
>> http://ftp.debian.org/debian/pool/main/g/grub/grub_0.97-35.diff.gz
>> 
>> is not correct

"not correct" is not really accurate. "Not available anymore", yes.
>> 
>> 
>> $ cat target/x86/grub/grub.mk | grep diff
>> GRUB_PATCH:=grub_0.97-35.diff.gz
>> 
>> 
>> Please, check it.
>
>You are welcome to submit a patch. (That'd be more helpful than
>demanding a solution.)
>
>Suggestions include
>1. Getting that same version from snapshot.debian.net instead, eg
>http://snapshot.debian.net/archive/2008/03/29/debian/pool/main/g/grub/grub_0.97-35.diff.gz
>
>2. Updating to a newer version. -47 looks like being in the next Debian
>release, so that should be good for 18 months or so.
>http://ftp.debian.org/debian/pool/main/g/grub/grub_0.97-47.diff.gz
>In this case the rest of our package may also need amendment.

And you could flesh out grub2 support in addition to updating (and
verifying, rediffing) grub1..
