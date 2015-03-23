From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 23 Mar 2015 13:50:34 +0100
Subject: [Buildroot] [PATCH 1/7 v3] support/download: make hash file
	optional
In-Reply-To: <5f50190fe62d33438bfe4c68ab566698c63d5102.1427037564.git.yann.morin.1998@free.fr>
References: <cover.1427037564.git.yann.morin.1998@free.fr>
 <5f50190fe62d33438bfe4c68ab566698c63d5102.1427037564.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMM+o9Sb2gW-62AU44tJ6E6hi_QXny9jXHmDv-tza+QpwMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 22, 2015 at 4:21 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, specifying a hash file for our download wrapper is mandatory.
>
> However, when we download a git, svn, bzr, hg or cvs tree, there's by
> design no hash to check the download against.
>
> Since we're going to have hash checking mandatory when a hash file
> exists, this would break those downloads from a repository.
>
> So, make specifying a hash file optional when calling our download
> wrapper and bail out early from the check-hash script if no hash file is
> specified.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,


-- 
Samuel
