From: Richard Braun <rbraun@sceen.net>
Date: Sat, 29 Dec 2012 18:33:20 +0100
Subject: [Buildroot] Generating patches against packages source code
In-Reply-To: <20121229181301.37d3d131@skate>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
 <20121229085947.130784d2@skate> <50DEFA7A.7020002@petroprogram.com>
 <20121229153251.6bdfecfe@skate> <50DF04B3.30801@petroprogram.com>
 <20121229171540.5bb22f40@skate> <50DF2029.1040605@petroprogram.com>
 <20121229170948.GA15925@mail.sceen.net>
 <20121229181301.37d3d131@skate>
Message-ID: <20121229173320.GA19710@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 29, 2012 at 06:13:01PM +0100, Thomas Petazzoni wrote:
> Please read the discussion before saying things that are out of topic.
> 
> Stefan is *NOT* talking about adding Signed-off-by lines to Buildroot
> patches, but Signed-off-by lines to patches against packages in
> Buildroot, i.e the patches that go in
> package/<pkg>/<pkg>-something.patch.
> 
> And those patches are not necessarily generated with Git. They can be
> manually generated with diff, generated with quilt, etc.
> 
> So, no, the story is not as simple as adding the -s option to git
> commit or git format-patch, because Stefan is maybe not using git to
> generate patches for the packages.

Well I understand that, which is why I've replied only after your answer
which mentions git to create the package patches. I didn't think it
would be out of topic then.

-- 
Richard Braun
