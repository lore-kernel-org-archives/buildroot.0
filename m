From: Lance Fredrickson <lancethepants@gmail.com>
Date: Thu, 29 Sep 2016 23:05:25 -0600
Subject: [Buildroot] uclibc-ng: bump to 1.0.18
In-Reply-To: <20160930025738.GM1947@waldemar-brodkorb.de>
References: <48e09c43-e43d-f67f-c6cb-b640c367ab5a@gmail.com>
 <20160929182247.GK1947@waldemar-brodkorb.de>
 <cc0e811d-72bf-5b85-c4ad-7b10f5e79aeb@gmail.com>
 <20160930025738.GM1947@waldemar-brodkorb.de>
Message-ID: <5966dfd0-098c-78ed-0c0a-2f2ec27ac105@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9/29/2016 8:57 PM, Waldemar Brodkorb wrote:
> I think another uClibc-ng regression, can you please try attached
> buildroot patch?

Thanks for you attention to this!
The patch for Rules.mak takes out 1 too many 'endif' statements. Adding 
in the missing one allowed the toolchain to compile without issue.

Lance
