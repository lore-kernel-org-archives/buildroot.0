From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 15:46:26 +0200
Subject: [Buildroot] [PATCH v4 3/3] .gitlab-ci.yml: add trigger per job
In-Reply-To: <20190408032255.12841-4-ricardo.martincoski@gmail.com>
References: <20190408032255.12841-1-ricardo.martincoski@gmail.com>
 <20190408032255.12841-4-ricardo.martincoski@gmail.com>
Message-ID: <7fdd9d95-c147-d5bf-ca56-c0fef507f737@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/04/2019 05:22, Ricardo Martincoski wrote:
> The check-* jobs are fast, so there is no need to add a per job trigger
> for them.

 This bit is no longer true, right?

 I can fix that up while applying, no need to resend.

 Also, I'll squash patches 2 and 3. Patch 2 is really not worth much on its own
IMO. It would make more sense to introduce the _base keys in a separate patch
(i.e. moving the artifacts to _base) and include the variable name in that
patch. But I don't think it's worth the effort to try to split like that.

 Regards,
 Arnout
