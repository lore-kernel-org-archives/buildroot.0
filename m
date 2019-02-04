From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 19:25:21 +0100
Subject: [Buildroot] [PATCH 2/2] package/python-docker: bump version to
 3.5.1
In-Reply-To: <20190204095824.18792-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 4 Feb 2019 10:58:24 +0100")
References: <20190204095824.18792-1-peter@korsgaard.com>
 <20190204095824.18792-2-peter@korsgaard.com>
Message-ID: <87va1zs966.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Pypi now proves a sha256 hash as well.
 > Drop 0001-setup.py-make-pip-optional.patch as upstream has now completely
 > removed the docker-py checks:

 > https://github.com/docker/docker-py/commit/accb9de52f6e383ad0335807f73c8c35bd6e7426

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
