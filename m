From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Feb 2019 11:03:01 +0100
Subject: [Buildroot] [PATCH v5 08/10] testing/tests/download: test git
 tag
In-Reply-To: <20180512025833.22998-9-ricardo.martincoski@gmail.com>
References: <20180512025833.22998-1-ricardo.martincoski@gmail.com>
 <20180512025833.22998-9-ricardo.martincoski@gmail.com>
Message-ID: <4e82b760-31f5-7189-c03b-42ded03007fb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/05/2018 04:58, Ricardo Martincoski wrote:
> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> 
> Add a tag to the static repo and check on the git refs test case the
> download of a git package:
>  - with the name of a tag as version;
>  - with the sha1 of a tag itself as version;
>  - with the partial sha1 of a tag itself as version;
>  - with the sha1 of a commit pointed by a tag as version;
>  - with the partial sha1 of a commit pointed by a tag as version;
>  - with the sha1 of a commit reachable only by a tag as version;
>  - with the partial sha1 of a commit reachable only by a tag as version.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> Cc: Arnout Vandecappelle <arnout@mind.be>

 Applied to master, thanks.

 Regards,
 Arnout
