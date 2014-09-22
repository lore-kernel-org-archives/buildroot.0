From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 22 Sep 2014 10:29:26 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-09-20
In-Reply-To: <20140921063014.4E0101017F9@stock.ovh.net>
References: <20140921063014.4E0101017F9@stock.ovh.net>
Message-ID: <541FEBF6.2020500@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/21/2014 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2014-09-20
> ===============================
>          mips | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/d1ec8de2950b9e4ae99e103fc012c9066d83c7a7/

Not a mips specific issue. It also fails on other architectures, like 
x86_64 for instance.

It seems to be a problem with the autotools:
   https://code.google.com/p/snappy/issues/detail?id=43
and
   https://code.google.com/p/snappy/issues/detail?id=67

-- 
Vincent
