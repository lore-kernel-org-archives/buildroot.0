From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Oct 2017 22:04:12 +0200
Subject: [Buildroot] [PATCH v2 1/2] qt5: add license file hashes for all
 submodules
In-Reply-To: <20171017215316.592370d2@windsurf.home>
References: <20171017191655.17723-1-ps.report@gmx.net>
 <20171017215316.592370d2@windsurf.home>
Message-ID: <20171017220412.3d6dd3f9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 17 Oct 2017 21:53:16 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Tue, 17 Oct 2017 21:16:54 +0200, Peter Seiderer wrote:
> 
> > +# Hash for license file:
> > +sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPL
> > +
> > +# Hash for license file:
> > +sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
> > +
> > +# Hash for license file:
> > +sha256 9ae1959e86bd49b9680f78e0b49d4e52ae88a3f234d497e175e42a7e8ed59216  LICENSE.LGPLv3  
> 
> It is a little bit extreme to repeat "Hash for license file" for each
> line. What about "Hashes for license files:" instead, just one time per
> file ?

O.k, will rework the patch...

Regards,
Peter

> 
> Thanks!
> 
> Thomas
