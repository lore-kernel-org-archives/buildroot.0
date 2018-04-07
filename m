From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Apr 2018 19:51:08 +0200
Subject: [Buildroot] [git commit] utils/genrandconfig: use
 --no-check-certificate in wget by default
In-Reply-To: <20180331151803.0A59C83FD9@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sat, 31 Mar 2018 17:17:51 +0200")
References: <20180331151803.0A59C83FD9@busybox.osuosl.org>
Message-ID: <873706ewhf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=0866a280e40a7a2c7d7d50cc7e87c3f4652aff0a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > A number of autobuilder failures are due to the fact that autobuilder
 > instances use old distributions, with old SSL certificates, and
 > therefore wget aborts with an error "The certificate of `xyz.org' is
 > not trusted.".

 > In order to avoid such failures that are not very interesting in the
 > context of the autobuilders, we pass --no-check-certificate to
 > wget. The integrity of the downloaded files is anyway verified by the
 > hashes, and this is only meant to be used in the context of
 > testing/CI, not in production.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
