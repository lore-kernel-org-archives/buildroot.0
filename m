From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 19:24:00 +0100
Subject: [Buildroot] [PATCHv2 0/8] fix scp and reintroduce source-check
 target
In-Reply-To: <20190204180553.18394-1-patrickdepinguin@gmail.com>
References: <20190204180553.18394-1-patrickdepinguin@gmail.com>
Message-ID: <20190204192400.6f2205e3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 Feb 2019 19:05:45 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> After the overwhelming support for 'source-check' at the Buildroot Developer
> Days ;-) , here is a second iteration of this series.

 :-)

> The first commit is actually a bugfix separate from source-check. In v1 of this
> series it was also included as the second of two 'scp'-related bugfixes, but it
> seems only the first bug-fix was applied at that time, which I hadn't realized
> until now.
> 
> Patches 2-8 are the actual source-check releated ones.
> For git, svn, bzr and cvs, there is no actual implementation which means that
> the corresponding download scripts will perform the standard download logic,
> which will also verify the validity of the specified revision on the remote
> server, but not as optimal as for the other methods.

What are the changes from v1 ? I don't see a changelog here or in the
patches themselves.

Perhaps you were overwhelmingly impatient to send this v2 that you
forgot the changelog ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
