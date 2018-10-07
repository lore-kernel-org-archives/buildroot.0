From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Oct 2018 21:32:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/qpdf: bump to version 8.2.1
In-Reply-To: <20181005133047.1127-1-olivier.schonken@gmail.com> (Olivier
 Schonken's message of "Fri, 5 Oct 2018 15:30:47 +0200")
References: <20181005133047.1127-1-olivier.schonken@gmail.com>
Message-ID: <871s91r1sd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Olivier" == Olivier Schonken <olivier.schonken@gmail.com> writes:

 > Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
 >  package/qpdf/qpdf.hash | 6 ++++--
 >  package/qpdf/qpdf.mk   | 2 +-
 >  2 files changed, 5 insertions(+), 3 deletions(-)

 > diff --git a/package/qpdf/qpdf.hash b/package/qpdf/qpdf.hash
 > index d27c9834b9..0beaeb2d7b 100644
 > --- a/package/qpdf/qpdf.hash
 > +++ b/package/qpdf/qpdf.hash
 > @@ -1,2 +1,4 @@
 > -# From https://sourceforge.net/projects/qpdf/files/qpdf/8.1.0/qpdf-8.1.0.sha512/download
 > -sha512
 > 1831bcaaed87dae268db5d61805d1483ec5c101f6ce594be660664c119597ae67cf011c2b50092964d785a814d5f6c780935127a89401fe37a1026ae4d3af15c
 > qpdf-8.1.0.tar.gz
 > +# From https://sourceforge.net/projects/qpdf/files/qpdf/8.1.0/qpdf-8.1.0.sha512/download:

You forgot to adjust the version number in the URL.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
