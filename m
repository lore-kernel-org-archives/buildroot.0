From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 16:31:08 +0200
Subject: [Buildroot] [PATCH 2/2] devmem2: fix output when
 _FILE_OFFSET_BITS=64
In-Reply-To: <20140629124348.56fc4864@free-electrons.com>
References: <1403194417-19986-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1403194417-19986-2-git-send-email-maxime.hadjinlian@gmail.com>
 <20140629124348.56fc4864@free-electrons.com>
Message-ID: <20140629163108.6cb6be2b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Jun 2014 12:43:48 +0200, Thomas Petazzoni wrote:
> Dear Maxime Hadjinlian,
> 
> On Thu, 19 Jun 2014 18:13:37 +0200, Maxime Hadjinlian wrote:
> > From: Colin Didier <colin.didier@devialet.com>
> > 
> > When built with _FILE_OFFSET_BITS=64, off_t becomes an long long int
> > and was printed as an unsigned int which lead to a garbled output.
> > 
> > Signed-off-by: Colin Didier <colin.didier@devialet.com>
> > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
> 
> Applied, thanks.

And the patch you provided against devmem did not apply... see
http://autobuild.buildroot.org/results/c45/c45eb706fb35ffc87fede777c3d20479a90872ae/build-end.log.
Looks like some whitespace issue, I've fixed that up, but it seems like
something is screwed in your setup to format or send patches.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
