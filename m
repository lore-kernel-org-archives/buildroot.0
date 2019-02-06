From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Feb 2019 11:05:13 +0100
Subject: [Buildroot] [PATCH v5 09/10] testing/tests/download: test git
 special ref
In-Reply-To: <20180512025833.22998-10-ricardo.martincoski@gmail.com>
References: <20180512025833.22998-1-ricardo.martincoski@gmail.com>
 <20180512025833.22998-10-ricardo.martincoski@gmail.com>
Message-ID: <cf2f9717-48a8-8616-b8ec-3d30bfbd9ab1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/05/2018 04:58, Ricardo Martincoski wrote:
> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> 
> Add a special ref to the static repo and check on the git refs test case
> the download of a git package:
>  - with the name of a special ref as version;

 We might remove support for getting special refs by name, but keep on
supporting getting special refs by sha1. So I've changed the test into getting
it by sha1 instead.

 Ideally there should also be a check for getting the parent of the special ref
by sha1, but I think that actually does *not* work now.

 Regards,
 Arnout
