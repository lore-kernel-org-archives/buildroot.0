From: Chris Brandt <Chris.Brandt@renesas.com>
Date: Fri, 6 Apr 2018 19:07:24 +0000
Subject: [Buildroot] [PATCH 1/2] cramfs: change to new site location
In-Reply-To: <nycvar.YSQ.7.76.1804061446470.28462@knanqh.ubzr>
References: <20180213195449.51516-1-chris.brandt@renesas.com>
 <20180213195449.51516-2-chris.brandt@renesas.com>
 <20180213211453.519b65eb@windsurf.lan>
 <SG2PR06MB1165EA4292BE78ADF8D3A1678AF60@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CANQCQpZgjJqSpY9Pma9wsB=QtPL5onLYLb5pdteTSUULOcMF-A@mail.gmail.com>
 <TY1PR01MB1562ADDDE3949C2BC35FC4408ABA0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CANQCQpZZMp8MXMRDMHg6vOr4f-GRYvBBeZB1MSNQvMk9BnfBzQ@mail.gmail.com>
 <nycvar.YSQ.7.76.1804061138320.28462@knanqh.ubzr>
 <CANQCQpZnN_q0OsPoYZc+nE6-=xSGtmk1SxgOQ4U_tFd84AbvkA@mail.gmail.com>
 <nycvar.YSQ.7.76.1804061305080.28462@knanqh.ubzr>
 <CANQCQpaUvOFQJG=8Suv7qNDnj2wT53R8JNCGSLNfXfhL5o2NqA@mail.gmail.com>
 <nycvar.YSQ.7.76.1804061446470.28462@knanqh.ubzr>
Message-ID: <TY1PR01MB1562D0608CCEC563067F9E008ABA0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, April 06, 2018, Nicolas Pitre wrote:
> On Fri, 6 Apr 2018, Matthew Weber wrote:
> > On Fri, Apr 6, 2018 at 12:06 PM, Nicolas Pitre
> <nicolas.pitre@linaro.org> wrote:
> > > On Fri, 6 Apr 2018, Matthew Weber wrote:
> > > > On Fri, Apr 6, 2018 at 10:41 AM, Nicolas Pitre
> <nicolas.pitre@linaro.org> wrote:
> > > > > I don't like the original patch at all and would like a completely
> > > > > different approach to keep the code saner. I'll commit it in a
> moment
> > > > > but I will need someone to test it.
> > > > >
> > > >
> > > > Perfect, I can do a test when you're ready.
> > >
> > > Please test the cross-endian branch and let me know how it works.
> > > If it works then I'll move it to the main branch.
> >
> > Tested successfully on a big endian powerpc target.
> 
> Good!  I moved it to the master branch.


So, it looks like the ball is back in my court to update the hash and 
put the endian command line options back in.

Except, looks like they changed from lower case "-b, -l" in the original
patch to upper case "-B, -L".

I'll update the original patch series and re-post to the Buildroot 
mailing list.


Chris
