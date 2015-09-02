From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Wed, 2 Sep 2015 09:02:41 +0200
Subject: [Buildroot] [PATCH 1/1] gnuradio: sys/types.h is needed for
 mode_t
In-Reply-To: <20150829232114.3c384d4d@free-electrons.com>
References: <1440861006-26198-1-git-send-email-gwenj@trabucayre.com>
 <20150829232114.3c384d4d@free-electrons.com>
Message-ID: <20150902090241.149048c7@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni
On Sat, 29 Aug 2015 23:21:14 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Dear Gwenhael Goavec-Merou,
> 
> On Sat, 29 Aug 2015 17:10:06 +0200, Gwenhael Goavec-Merou wrote:
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > fix :
> > http://autobuild.buildroot.net/results/8e3/8e3afd5f22312f0660f631fdb82bbb64eda913fb/build-end.log
> > 
> > error: 'mode_t' has not been declared
> > 
> > Signed-off-by: Gwenhael Goavec-Merou
> > <gwenhael.goavec-merou@trabucayre.com> ---
> >  .../gnuradio/0002-types_t-is-need-for-mode_t.patch    | 19
> > +++++++++++++++++++ 1 file changed, 19 insertions(+)
> >  create mode 100644
> > package/gnuradio/0002-types_t-is-need-for-mode_t.patch
> 
> Applied, thanks. As we discussed, please submit the patch upstream.
> Thanks!
> 
Done :
https://github.com/gnuradio/gnuradio/commit/3e2dc168467304212328abd061bf10f0c511f17f
Gwenhael
