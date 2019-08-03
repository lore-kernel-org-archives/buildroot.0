From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Aug 2019 12:45:40 +0200
Subject: [Buildroot] [PATCH 5/5] support/testing: add python-numpy tests
In-Reply-To: <20190801210920.31338-5-romain.naour@smile.fr>
References: <20190801210920.31338-1-romain.naour@smile.fr>
 <20190801210920.31338-5-romain.naour@smile.fr>
Message-ID: <29f93759-7ef6-114d-0bee-a482e7cb0c95@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/08/2019 23:09, Romain Naour wrote:
> This commit add 3 runtime tests for python-numpy.

 As discussed face to face, please make two changes:

- rebase on top of Ricardo's updated kernel so we don't need to rebuild the kernel;

- add a test that we're *really* using lapack, because in one of my attempts I
wasn't using lapack and the test still succeeded.

 Regards,
 Arnout
