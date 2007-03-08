From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 8 Mar 2007 12:49:48 +0100
Subject: [Buildroot] target busybox skeleton.
In-Reply-To: <45EFF020.2020406@cs.helsinki.fi>
References: <20070218173211.GA31717@zelow.no> <20070308103626.GB31261@aon.at>
	<45EFF020.2020406@cs.helsinki.fi>
Message-ID: <20070308114948.GE31261@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 08, 2007 at 01:14:40PM +0200, Heikki Lindholm wrote:
>Bernhard Fischer kirjoitti:
>>On Sun, Feb 18, 2007 at 06:32:11PM +0100, Thomas Lundquist wrote:
>>
>>>Maybe it's a bit too tiny?
>>>
>>>I'd suggest that /usr/lib is added.
>>
>>
>>hmz. And what if i don't have anything in /usr/lib? Wasted dentry.
>>
>>What about switching to "install -D" instead, where appropriate?
>
>If doing major changes, please consider taking portability issues into 
>account. In this case, "-D" isn't supported on OS X.

It shouldn't be too hard to ship our own working install source an
compile and use that for the host, but thanks for the hint anyway.

MacOS-BSD already has trouble due to the use of "cp -a", IIRC and i was
gradually switching those over to cp -dpf like suggested in one
bug-report.
