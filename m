From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 30 Jul 2007 11:24:14 +0200
Subject: [Buildroot] failing to build the buildroot
In-Reply-To: <OF54359986.7DD332CA-ONC2257328.0032AEDA-C3257328.002CFE8E@visonic.com>
References: <20070730090905.GA23273@aon.at>
	<OF54359986.7DD332CA-ONC2257328.0032AEDA-C3257328.002CFE8E@visonic.com>
Message-ID: <20070730092414.GD23273@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 30, 2007 at 01:15:33PM +0400, Shai Lifshitz wrote:
>maybe you give me a hint how to solve the problem? I'll appreciate it 
>alot.
>I am trying to build the buildroot for a week with no success
>
>
>
>
>
>Bernhard Fischer <rep.dot.nop@gmail.com>
>07/30/2007 01:09 PM
> 
>        To:     Shai Lifshitz <ShaiL@visonic.com>
>        cc:     buildroot at uclibc.org
>        Subject:        Re: [Buildroot] failing to build the buildroot
>
>
>On Mon, Jul 30, 2007 at 12:51:31PM +0400, Shai Lifshitz wrote:
>>Dir Sir,
>>
>>I downloaded today the buildroot-snapshot.tar.bz2.tar file from the FTP 
>
>>10:28:27 (9.77 KB/s) 
>>-`/home/shail/downloads/tt3/buildroot/dl/gcc-4.2.0.tar.bz2' 
>>saved[44,057,527/44,057,527]
>>
>>mkdir -p /home/shail/downloads/tt3/buildroot/toolchain_build_arm
>>rm -rf /home/shail/downloads/tt3/buildroot/toolchain_build_arm/gcc-4.2.0
>>bzcat /home/shail/downloads/tt3/buildroot/dl/gcc-4.2.0.tar.bz2 | tar -C 
>>/home/shail/downloads/tt3/buildroot/toolchain_build_arm   -xf -
>>
>>tar: Skipping to next header
>>tar: Archive contains obsolescent base-64 headers
>>
>>bzcat: Data integrity error when decompressing.
>>        Input file = 
>>/home/shail/downloads/tt3/buildroot/dl/gcc-4.2.0.tar.bz2, output file = 
>>(stdout)
>>
>>It is possible that the compressed file(s) have become corrupted.
>
>Well, this says about all..

[please keep this on the list, thanks]

rm -f dl/gcc-4.2*tar*
make distclean && make
