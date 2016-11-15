From: Tobias Klauser <tklauser@distanz.ch>
Date: Tue, 15 Nov 2016 12:32:56 +0100
Subject: [Buildroot] [PATCH 1/2] package/libnet: fix compilation with
	musl
In-Reply-To: <20161115113858.1beeb768@free-electrons.com>
References: <20161114112948.13292-1-tklauser@distanz.ch>
 <20161114112948.13292-2-tklauser@distanz.ch>
 <20161115113858.1beeb768@free-electrons.com>
Message-ID: <20161115113256.GA3373@distanz.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-11-15 at 11:38:58 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Hello,
> 
> On Mon, 14 Nov 2016 12:29:47 +0100, Tobias Klauser wrote:
> > Patch taken from from upstream:
> > https://github.com/sam-github/libnet/commit/ffd7fab744a9ad2893169a8fb6244074604d5d0d
> > 
> > Adjusted the file paths manually so the patch applies to the packaged
> > libnet sources.
> > 
> > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> > ---
> >  package/libnet/0001-support-musl-libc.patch | 50 +++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >  create mode 100644 package/libnet/0001-support-musl-libc.patch
> 
> Adding the patch fixing the musl build issue is good... but if you
> don't adjust the Config.in file of this package to re-enable it for
> musl configurations, it's a bit useless, no?
> 
> So I've fixed that, and applied your patch to next. Thanks!

Indeed, I forgot to stage that change in my local commit. Sorry about
that and thanks for fixing it up!
