From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Feb 2012 17:30:13 +0100
Subject: [Buildroot] [git commit branch/next] DOWNLOAD_WGET: use -O
	instead of -P to set output file
In-Reply-To: <CA+appbNv_c0r_uDZWw=x3WiHtykt3xX9qrQUTA4YMFq-AUgZ4w@mail.gmail.com>
 (Spenser Gilliland's message of "Tue, 14 Feb 2012 10:14:52 -0600")
References: <20120214115140.4C70390A99@busybox.osuosl.org>
 <CA+appbOppm780+jAe6LKqGR9mendwqdtvfTEB=Cntrz=5RynSQ@mail.gmail.com>
 <CAM+bi4uo_s_xMy-XVfNhSBwwm70jMxmz5UXB71fbV+=pROYdNQ@mail.gmail.com>
 <87sjidv1yx.fsf@macbook.be.48ers.dk>
 <CA+appbNv_c0r_uDZWw=x3WiHtykt3xX9qrQUTA4YMFq-AUgZ4w@mail.gmail.com>
Message-ID: <87k43pv0mi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser309@gmail.com> writes:

 Spenser> This workaround works; however, the default is to prepend a / to the
 Spenser> front of the source name.  This leads to the following being
 Spenser> downloaded.

 Spenser> Without the slash the download should work. Peter should the patch
 Spenser> remove the prepended slash as well?

I guess so. We would need to audit that all <blah>_SITE have a trailing
space though, and this could potentially break out-of-tree stuff.

-- 
Bye, Peter Korsgaard
