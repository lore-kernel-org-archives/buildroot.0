From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 3 May 2007 11:57:59 +0200
Subject: [Buildroot] gcc-4.1.2 eabi softfloat toolchain,
	undefined reference to "raise"
In-Reply-To: <20070503083551.GB2783@z1.synertronixx>
References: <20070426080257.GA7608@z1.synertronixx>
	<20070430125731.GC18543@aon.at>
	<20070503083551.GB2783@z1.synertronixx>
Message-ID: <20070503095759.GA552@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 03, 2007 at 10:35:52AM +0200, Konstantin Kletschke wrote:
>Am 2007-04-30 14:57 +0200 schrieb Bernhard Fischer:
>
>> This is a known bug with gcc. There is a bugfix (that i don't really
>> understand and consequently don't know if it is really accurate)
>> floating around for this one.
>
>Well I searched like mad but I did not find one.

A quick google for these keywords:
__div0 raise arm softfloat

would have turned up said patch, fwiw.

>I digged around and added an empty raise() function and my bootloader
>compiled after that and the binary runs fine so far. Hmm...
>
>> If in doubt, please file a PR in http://gcc.gnu.org/bugzilla/ about this bug
>> and perhaps add a pointer to the patch if this bug is not yet entered in
>> bugzilla.
>
>I will enter it. 

TIA,
