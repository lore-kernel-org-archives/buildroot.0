From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Sep 2017 22:58:49 +0200
Subject: [Buildroot] [PATCH] python-numpy: Ensure `_npy_scaled_cexp{, f,
 l}` is defined when needed
In-Reply-To: <20170922223053.25433-1-abrodkin@synopsys.com>
References: <20170922223053.25433-1-abrodkin@synopsys.com>
Message-ID: <141011cc-4937-c27b-4763-30cb79df475d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-09-17 00:30, Alexey Brodkin wrote:
> With update of Numpy to the latest version we've got one change which
> breaks Numpy compilcation in some cases.
> 
> This change back-ports upstream fix from:
> https://github.com/numpy/numpy/pull/9740
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
> Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>

 Applied to master, thanks. It has apparently also been merged upstream, great!

 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
