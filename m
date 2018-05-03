From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 3 May 2018 23:11:40 +0200
Subject: [Buildroot] [RFC v1 1/2] libopenssl: bump version to 1.1.0h
In-Reply-To: <20180502092124.500f37cc@windsurf.home>
References: <20180417211921.18718-1-ps.report@gmx.net>
 <20180502092124.500f37cc@windsurf.home>
Message-ID: <20180503231140.584503c5@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, 2 May 2018 09:21:24 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
> 
> On Tue, 17 Apr 2018 23:19:20 +0200, Peter Seiderer wrote:
> > - remove all parallel build patches (openssl build-system changed)
> > 
> > - rebased 0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
> > 
> > - replaced 0002-cryptodev-Fix-issue-with-signature-generation.patch with
> >   upstream version
> > 
> > - rebased 0003-Reproducible-build-do-not-leak-compiler-path.patch
> > 
> > - fix uclibc build failure, use '-DOPENSSL_NO_ASYNC'
> > 
> > - remove legacy enable-tlsext configure option
> > 
> > - change legacy INSTALL_PREFIX to DESTDIR
> > 
> > - remove 'libraries gets installed read only, so strip fails'
> >   workaround (not needed anymore)
> > 
> > - change engine directory from /usr/lib/engines to
> >   /usr/lib/engines-1.1
> > 
> > - change license file hash, no license change, only the following
> >   hint was removed:
> > 
> >     Actually both licenses are BSD-style Open Source licenses.
> >     In case of any license issues related to OpenSSL please
> >     contact openssl-core at openssl.org.
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> 
> This patch has received several comments from different people
> reporting issues. Since your patch series was sent as RFC and people
> have reported problems, I'll mark the patches as Changes Requested in
> patchwork. But of course, please resend a new version when you have
> some time to work on this.

New version will follow soon, will keep it as RFC until more packages
depending on openssl are compile-/runtime tested with the new version
(or in case of too much failures maybe an extra openssl-1.1.0 package
is needed)...

Regards,
Peter

> 
> Thanks!
> 
> Thomas
