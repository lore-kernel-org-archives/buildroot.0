From: Rick Robino <rick.robino@ipfabrics.com>
Date: Sat, 16 Nov 2013 02:59:50 -0800
Subject: [Buildroot] longterm kernel releases: version-URI different for
	v2.x kernels
In-Reply-To: <20131116113842.1c01a56d@skate>
References: <76128FA7-9969-4BC7-B8F8-07F5BEDDD177@ipfabrics.com>
 <20131116113842.1c01a56d@skate>
Message-ID: <992F5237-77FA-4695-9864-0057938AD228@ipfabrics.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Nov 16, 2013, at 2:38 AM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> On Fri, 15 Nov 2013 23:53:40 -0800, Rick Robino wrote:
> 
>> I encountered problems automatically downloading kernel version
>> 2.6.32.61, one of the current longterm releases.  It looks like the
>> URL might have changed, so I thought that I would mention it here in
>> case this fact might be news to anyone.
>> 
>> The longterm kernels are in a subdirectory called
>> ?v2/.6/longterm/vA.B.C?.  Buildroot only looks in ?v2.6?, which works
>> fine for standard kernels but not the longterm ones for 2.6.
> 
> Yes. Buildroot cannot guess if the kernel version you're using is a
> "normal" version or a "longterm" version. Therefore, when you choose to
> only give the kernel version in the configuration, it only looks in
> 2.6/ or 3.x/. If you need a kernel version that is available in some
> other location, then you should use the "Custom tarball" configuration
> choice, which allows you to pass an arbitrary URL to a tarball,
> either located on kernel.org or on some other place.
> 
> Best regards,
> 
> Thomas

I suspected that there was a ?right way?.  Thank you, Thomas.

? 
Rick

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131116/46c658fe/attachment-0001.html>
