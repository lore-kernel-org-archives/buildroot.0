From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Wed, 17 Aug 2016 06:44:16 +0000
Subject: [Buildroot] [PATCH] gmp: disable assembly for arc
In-Reply-To: <87bn0txnp2.fsf@dell.be.48ers.dk>
References: <1471272107-17275-1-git-send-email-vzakhar@synopsys.com>
 <87bn0txnp2.fsf@dell.be.48ers.dk>
Message-ID: <1471416256.19853.54.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

yes, I am just working on fixing it in upstream gmp and hope fix will be send soon.

Thanks.

On Tue, 2016-08-16 at 07:55 +0200, Peter Korsgaard wrote:
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > "Vlad" == Vlad Zakharov <Vladislav.Zakharov@synopsys.com> writes:
> ?> It has different inline assembly constraints that
> ?> are not supported after update to gcc-6.
> 
> ?> Fixes:
> ?> http://autobuild.buildroot.net/results/c91/c9143eec0834017d57d5352d6fc95b5fae38da00//
> ?> and a lot of other failures of gmp-6.1.1 for ARC.
> 
> ?> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> 
> Committed, thanks.
> 
> Are you working on getting this fixed in upstream gcc/gmp for future
> releases?
> 
-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>
