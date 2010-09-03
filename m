From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 3 Sep 2010 10:59:19 -0500
Subject: [Buildroot] About Git through SSH
In-Reply-To: <20100903170323.3b5a8e6f@surf>
References: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org>
	<201009030937.31967.minimod@morethan.org>
	<20100903170323.3b5a8e6f@surf>
Message-ID: <201009031059.21821.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri September 3 2010, Thomas Petazzoni wrote:
> On Fri, 3 Sep 2010 09:37:29 -0500
> "Michael S. Zick" <minimod@morethan.org> wrote:
> 
> > I support users back to the oldest, commonly used, git versions -
> > Where I define that as the version in the current Debian stable
> > release.
> > 
> > So the commentary in the gitolite release still applies to older git
> > versions. http://packages.debian.org/lenny/git-core
> > 
> > Somewhere between v1.5 and v1.7 they must have added parsing "ssh://"
> > to the git client.
> > 
> > You might want to add a comment in the "Minimum Software
> > Requirements" of Buildroot, to go along with the addition of the user
> > specified scheme feature for the case of "git xxx ssh://..."
> > style URIs
> > 
> > Might cut down on the end-user puzzlement of: "Why doesn't this work
> > for me?"
> > 
> > Note: I think the change happened at v1.6 but I haven't checked to be
> > certain.
> 
> In Buildroot, I think only publicly-available Git trees will be used as
> the source URL for packages, and such trees usually use the git:// or
> http:// schemes rather than ssh://, which is usually used for a
> private, read-write access to a repo.
> 

I only suggested that you add a comment to the software requirements for
using the new end-user specified repository field in the case of git.

Mike
> Regards,
> 
> Thomas
