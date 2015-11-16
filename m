From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 16 Nov 2015 09:43:54 +0100
Subject: [Buildroot] [PATCH] support/download: fetch all refs on full
	git clone
In-Reply-To: <5645880C.5040103@mind.be>
References: <1446871164-19229-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <20151112170726.GB11143@ketchup.mtl.sfl> <5645880C.5040103@mind.be>
Message-ID: <14498168.cEIkmZpZ53@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Friday 13 November 2015 07:49:48 Arnout Vandecappelle wrote:
[...]
> What I
> think would make sense is that for distributed VCS downloads (i.e.
> git and hg) we keep a full (shallow) clone in DL_DIR in addition to
> the tarball. That makes handling updates a lot more efficient. We
> probably would want to expose that to PRIMARY and SECONDARY download
> sites as well. Especially the PRIMARY would be useful, since it would
> allow you to start from a local clone of e.g. linux.git (which may
> not have the ref you need), and then just fetch the missing refs from
> upstream.
> 
>  This will not be easy to implement, though, since we'd need to handle
> e.g. multiple remotes that end up in the same DL_DIR/foo.git
> repository.
For your information, I have in my drafts a patch which implement a 
similar idea. I think I would be able to send a first version in 1 or 2 
weeks.

BR,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
