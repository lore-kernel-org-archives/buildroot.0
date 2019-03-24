From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Mon, 25 Mar 2019 10:21:27 +1100
Subject: [Buildroot] [PATCH] lvm2: Update to 2.02.183
In-Reply-To: <87ef6wbsqh.fsf@dell.be.48ers.dk>
References: <20190322021921.25949-1-sam@mendozajonas.com>
 <87ef6wbsqh.fsf@dell.be.48ers.dk>
Message-ID: <678a8622a9a476903043c5f312d0c1b78c832614.camel@mendozajonas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2019-03-24 at 09:07 +0100, Peter Korsgaard wrote:
> > > > > > "Samuel" == Samuel Mendoza-Jonas <sam@mendozajonas.com> writes:
> 
>  > In particular update to solve an issue where LVM would fail to
>  > initialise LVM devices when asynchronous IO was not available and it
>  > would fail to fall back to synchronous IO. [0][1]
> 
>  > [0] https://bugzilla.redhat.com/show_bug.cgi?id=1650652
>  > [1] https://github.com/open-power/petitboot/issues/60
> 
>  > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> 
> Committed, thanks.
> 
> Should this also be applied to the 2019.02 series?
> 

Yes it would also apply there.
