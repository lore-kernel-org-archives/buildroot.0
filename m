From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Mar 2014 23:52:02 +0100
Subject: [Buildroot] [v2] eigen: (optionally) install unsupported modules
In-Reply-To: <1395173894-4811-1-git-send-email-zinosat@tiscali.it>
References: <1395173894-4811-1-git-send-email-zinosat@tiscali.it>
Message-ID: <20140318235202.202ac1ab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Davide Viti,

On Tue, 18 Mar 2014 21:18:13 +0100, Davide Viti wrote:
> I'm working on a package that includes some files inside the
> "unsupported" folder. The unsupported modules can be optionally
> selected.
> 
> Let's see if I can manage to properly send a signed patch with
> introductory message: sorry for the noise!

Almost :-)

For a single patch, there is no real need to send a separate
introduction message, the patch itself is enough.

To indicate the new version, you should generate the patch as follows:

	git format-patch --suject-prefix="PATCHv2" HEAD^

so that the patch title becomes:

	[PATCHv2] title of the patch

You manually added [v2] to the title of your introduction e-mail, but
it's actually more important to have it on the patches themselves. And
don't do it manually, use git --subject-prefix option to do it!

See
http://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog
for more details.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
