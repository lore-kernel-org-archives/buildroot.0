From: clshotwe at rockwellcollins.com <clshotwe@rockwellcollins.com>
Date: Tue, 17 Sep 2013 21:15:31 -0500
Subject: [Buildroot] [PATCH v2 03/17] ustr: new package
In-Reply-To: <20130912213430.0898522c@skate>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>	<1378936777-28308-4-git-send-email-clshotwe@rockwellcollins.com>
 <20130912213430.0898522c@skate>
Message-ID: <OF971CA447.93A3E414-ON86257BEA.000C0991-86257BEA.000C6886@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/12/2013 
02:34:30 PM:

> The naming of patch files should be fixed globally in the 
> patch series.
> We use lower case names, with '-' as the separator between
> words in the
> patch description.
> 
> Also, this package doesn't build properly when the 
> toolchain does not
> have large file support. Just like libselinux, the 
> Makefile hardcodes
> -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE. Your options 
> are either to
> make ustr depend on large file support in the toolchain, 
> or to modify
> the Makefile.
> 
I will correct all of the patch names since I forgot to make that change 
in my last revision.  I will also add the large file support dependency 
where needed and get a new set of patches sent out. Do I need to continue 
sending out all of the patches until they are all submitted even if they 
have no changes?

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130917/7cc3498a/attachment.html>
