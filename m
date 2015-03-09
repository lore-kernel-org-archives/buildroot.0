From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 21:15:08 +0100
Subject: [Buildroot] [V2 2/2] graph-depends: add an option
 --stop-on-virtual
In-Reply-To: <CAB0FRsvxotGUKRC2q7R_JKPCajZb68X3r2qnjciehP-cqXENBg@mail.gmail.com>
References: <1420295353-8065-1-git-send-email-francois.perrad@gadz.org>
 <1420295353-8065-2-git-send-email-francois.perrad@gadz.org>
 <20150308221843.2d6fbf7d@free-electrons.com>
 <CAB0FRsvxotGUKRC2q7R_JKPCajZb68X3r2qnjciehP-cqXENBg@mail.gmail.com>
Message-ID: <20150309211508.39c2a0ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Mon, 9 Mar 2015 20:32:16 +0100, Fran?ois Perrad wrote:

> I agree with you.
> The graphs become quickly too large.
> The current option --depth seems to be only a workaround against an
> infinite recursion when the graph has a cycle.

Well, I don't really think --depth is meant to avoid infinite
recursion: I don't think it's possible to have infinite recursion since
we can't have cyclic dependencies in Buildroot.

> But at this time, we haven't found the good way (or the good use
> cases) to limit the size of the graph.

I believe being able to exclude certain packages (and their dependency
tree) would be useful.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
