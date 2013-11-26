From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue, 26 Nov 2013 03:10:38 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results
	for	2013-11-25
In-Reply-To: <CAFbHwiRMDbi1D2U=wP-4ZdmubS2SS6j_reBWYcGS_C01VoSn9A@mail.gmail.com>
References: <20131126073003.0DD121014E8@stock.ovh.net>
 <CAFbHwiRMDbi1D2U=wP-4ZdmubS2SS6j_reBWYcGS_C01VoSn9A@mail.gmail.com>
Message-ID: <OF86FEC0CA.66DC8F3C-ON86257C2F.0030D3EF-86257C2F.00326736@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will,

Will Newton <will.newton@gmail.com> wrote on 11/26/2013 02:41:19 AM:

> On Tue, Nov 26, 2013 at 7:30 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> >        arm |           host-protobuf-c-0.15 | NOK | 
http://autobuild.buildroot.net/results/f47c4f0883019ba3a8e61a9ae51b7bd7f347b38c/

> 
> This is an odd one - could it be that protobuf cannot be built with
> parallel make?

This is the same conclusion Arnout and myself came to yesterday. Please 
see http://lists.busybox.net/pipermail/buildroot/2013-November/083302.html

I have just submitted a patch to fix this.

Thanks,
-Ryan
