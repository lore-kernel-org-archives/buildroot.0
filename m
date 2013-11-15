From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Nov 2013 10:45:11 +0100
Subject: [Buildroot] [PATCH] e2fsprogs: Rename the first patch to match
 the naming policy.
In-Reply-To: <CAAXf6LW2zFZ2OCh4G7SrPAc52hpAb0KC=HuOj=gFaA2fsTu_cg@mail.gmail.com>
References: <1384507838-4675-1-git-send-email-Sonic.adi@gmail.com>
 <CAAXf6LW2zFZ2OCh4G7SrPAc52hpAb0KC=HuOj=gFaA2fsTu_cg@mail.gmail.com>
Message-ID: <20131115104511.56ab9a97@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 15 Nov 2013 10:39:52 +0100, Thomas De Schampheleire wrote:

> >  package/e2fsprogs/e2fsprogs-0001-sem-init-libs.patch | 11 +++++++++++
> >  package/e2fsprogs/e2fsprogs-sem-init-libs.patch      | 11 -----------
> >  2 files changed, 11 insertions(+), 11 deletions(-)
> >  create mode 100644 package/e2fsprogs/e2fsprogs-0001-sem-init-libs.patch
> >  delete mode 100644 package/e2fsprogs/e2fsprogs-sem-init-libs.patch
> 
> Also here I wonder why git/git-format-patch did not recognize the move?

Because you need to explicitly do a 'git format-patch -M', or configure
Git in your ~/.gitconfig to enable rename detection permanently.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
