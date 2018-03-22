From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 22 Mar 2018 13:10:54 +0100
Subject: [Buildroot] [PATCH v1 1/2] gnutls: needs C++ support
In-Reply-To: <20180322054912.akgs3lgdfgiiee6s@sapphire.tkos.co.il>
References: <20180321202312.23021-1-ps.report@gmx.net>
 <20180322054912.akgs3lgdfgiiee6s@sapphire.tkos.co.il>
Message-ID: <20180322131054.0f1fa5ca@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Thu, 22 Mar 2018 07:49:13 +0200, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Peter,
> 
> On Wed, Mar 21, 2018 at 09:23:11PM +0100, Peter Seiderer wrote:
> > Fixes Bug 10846 ([1]):
> > 
> >   checking how to run the C++ preprocessor... cpp
> >   configure: error: in `.../build/gnutls-3.5.17':
> >   configure: error: C++ preprocessor "cpp" fails sanity check
> >   See `config.log' for more details
> > 
> > [1] https://bugs.busybox.net/show_bug.cgi?id=10846
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> 
> This is strange. Do you have idea why the autobuilders didn't catch that?

No clue...., maybe the missing combination of hard float and no C++?

Maybe worth an test-pkg run?

Regards,
Peter

> 
> baruch
> 
