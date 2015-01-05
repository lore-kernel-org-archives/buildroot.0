From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 5 Jan 2015 12:03:58 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-12-13
In-Reply-To: <20141214073018.09EE8101651@stock.ovh.net>
References: <20141214073018.09EE8101651@stock.ovh.net>
Message-ID: <54AA7DAE.80208@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/14/2014 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2014-12-13
> ===============================

>       mipsel |         gst1-plugins-bad-1.4.4 | NOK | http://autobuild.buildroot.net/results/427c56580f65ae9452ad68727155097a8df48914/

This is a problem of the opencv.pc file. It contains the full path of
the libraries instead of strings like '-lopencv_something'. If we fix
the opencv.pc file, we fix this problem.

There is a bug report opened in almost October here:

  http://code.opencv.org/issues/3931

And Samuel (in CC) did a revision of it. Maybe he has more information
about how is this going.

Should we fix this in Buildroot if upstream stills not fixing it?

Regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
