From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Sep 2019 09:53:52 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] qt5base: Add patch to
 fix compile issue with gcc9
In-Reply-To: <8d2d7eed-81d2-e2bf-4345-cac3f73ad01c@orolia.com>
References: <20190919073529.30254-1-julien.beraud@orolia.com>
 <87ef0c1f4j.fsf@dell.be.48ers.dk>
 <24a3771b-2bf4-66a7-2b84-13eeb87488c3@orolia.com>
 <20190919214812.6f719f06@windsurf>
 <8d2d7eed-81d2-e2bf-4345-cac3f73ad01c@orolia.com>
Message-ID: <20190920095352.5279ffcf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 20 Sep 2019 07:50:34 +0000
Julien B?raud <julien.beraud@orolia.com> wrote:

> Thanks for the explanation. So the correct way to send a patch for a 
> specific branch is :
> [PATCH branch-name] ... ?

Yes, with the exception that you can/should omit branch-name when the
target branch is master. So essentially, it's only for special cases (a
patch for the next branch, when the next branch is open, or for a
LTS/maintenance branch) that you need to specify the branch name. When
there's no branch name, we assume your patch targets master.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
