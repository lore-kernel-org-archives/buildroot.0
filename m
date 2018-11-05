From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 05 Nov 2018 12:09:04 +0100
Subject: [Buildroot] [PATCH v2] package/libnfs: bump to version 3.0.0
In-Reply-To: <20181105091724.4e542ff8@windsurf>
References: <20181105062705.20985-1-joerg.krause@embedded.rocks>
 <20181105091724.4e542ff8@windsurf>
Message-ID: <739c919b58c42b5a314bd9877f0f1c7a38d8daf7.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2018-11-05 at 09:17 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon,  5 Nov 2018 07:27:05 +0100, J?rg Krause wrote:
> > Also add an patch from upstream to fix building libnfs with the musl C
> > library. This issue was introduced upstream between version 2.0.0 and
> > version 3.0.0.
> > 
> > Note, that upstreams commit message says it fixes a warning. However, as
> > musl is more strictly regarding missing headers it actually fixes the
> > build with musl.
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > ---
> > v1 -> v2:
> >  - fix hash of license file COPYING
> 
> What are the changes in the COPYING file ?

I contains a clarification about the .x files being destributed under
the simplified BSD licence.

We already note in LIBNFS_LICENSE that the .x files are BSD-2-Clause.

Shall I send a v3?

J?rg
