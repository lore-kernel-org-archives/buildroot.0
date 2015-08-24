From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 24 Aug 2015 10:04:42 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-08-20
In-Reply-To: <20150821063014.F0716100F4D@stock.ovh.net>
References: <20150821063014.F0716100F4D@stock.ovh.net>
Message-ID: <55DADE2A.5030509@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 08/21/2015 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2015-08-20

>       mipsel |                    zyre-v1.0.0 | NOK | http://autobuild.buildroot.net/results/0ab4c6a4bb4942d51e7712073d4731d81ecb5251/

Fixed by:

http://patchwork.ozlabs.org/patch/509948/

Note that I also tried to fix it by following the
`$(PKG_CONFIG_HOST_BINARY) --libs <whatever>` approach, but it doesn't work.

Regards,

Vincent.
