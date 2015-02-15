From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 15 Feb 2015 14:25:20 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-02-13
In-Reply-To: <20150214224243.47b77b67@free-electrons.com>
References: <20150214073013.E7748101008@stock.ovh.net>
 <20150214224243.47b77b67@free-electrons.com>
Message-ID: <54E09E40.403@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 14/02/15 22:42, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 14 Feb 2015 08:30:13 +0100 (CET), Thomas Petazzoni wrote:
>>       mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/b1ec2e994c9b1f2629f37f54e04b228ad13ce3ca/
> 
> This is another uClibc issue. Vicente, I believe we don't yet have an
> exception for this one, do we? Or is the issue fixed, but not visible
> yet since we have not yet rebuilt the toolchains?

No, this issue is not fixed upstream. It was reported long time ago.

We do not have an exception to this in the autobuild-run script. I will
add one. Thanks.

Regards,
--
Vincent
