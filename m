From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Dec 2013 15:25:41 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-12-02
In-Reply-To: <529DE716.1000205@zacarias.com.ar>
References: <20131203073003.0FA7E1014F4@stock.ovh.net>
 <529DE4FE.8020900@imgtec.com> <529DE716.1000205@zacarias.com.ar>
Message-ID: <20131203152541.47e942be@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 03 Dec 2013 11:13:42 -0300, Gustavo Zacarias wrote:

> > This failure is caused by another failure on gnutls package. This
> > problem has already fixed upstream so it will be available on the
> > next gnutls release:
> > https://gitorious.org/gnutls/gnutls/commit/346e323228f5cc71664c2f49541f816f88914342
> 
> My fault for bumping gnutls :)
> I'm waiting for a new release since the patchset is big, otherwise it
> can be reverted to 3.2.6 since it's not a security bump.

I think reverting would be good, so that we no longer have the
autobuilder failures, and we can see if there are other problems
instead of falling many times into the gnutls issue.

Of course, as soon as a new release fixing the problem is around, we
can bump.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
