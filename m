From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Dec 2012 18:13:01 +0100
Subject: [Buildroot] Generating patches against packages source code
In-Reply-To: <20121229170948.GA15925@mail.sceen.net>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
 <20121229085947.130784d2@skate> <50DEFA7A.7020002@petroprogram.com>
 <20121229153251.6bdfecfe@skate> <50DF04B3.30801@petroprogram.com>
 <20121229171540.5bb22f40@skate> <50DF2029.1040605@petroprogram.com>
 <20121229170948.GA15925@mail.sceen.net>
Message-ID: <20121229181301.37d3d131@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Braun,

On Sat, 29 Dec 2012 18:09:48 +0100, Richard Braun wrote:
> On Sat, Dec 29, 2012 at 06:54:01PM +0200, Stefan Fr?berg wrote:
> > Ah, I was hoping (because Im lazy ;-) ) that I don't need to add
> > manually all those
> > Signed-off lines.
> 
> You don't.
> 
> > I was always wondering how other people add all those several inside
> > Signed-off lines when submitting one big patch to this list.
> 
> See git help format-patch. This command has an option -s (--signoff)
> to automatically produce the signed-off lines.

Please read the discussion before saying things that are out of topic.

Stefan is *NOT* talking about adding Signed-off-by lines to Buildroot
patches, but Signed-off-by lines to patches against packages in
Buildroot, i.e the patches that go in
package/<pkg>/<pkg>-something.patch.

And those patches are not necessarily generated with Git. They can be
manually generated with diff, generated with quilt, etc.

So, no, the story is not as simple as adding the -s option to git
commit or git format-patch, because Stefan is maybe not using git to
generate patches for the packages.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
