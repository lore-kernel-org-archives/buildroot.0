From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 22:33:41 +0100
Subject: [Buildroot] [PATCH 2/2] python-msgpack: remove useless 'depends
	on' in comment
In-Reply-To: <1457641016-3054-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 10 Mar 2016 21:16:56 +0100")
References: <1457641016-3054-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1457641016-3054-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877fhakoga.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > In commit 6709fad224692ae5e0788bbd30145f7d622b52a4, python-msgpack was
 > bumped to a new version that has support for Python 3. The "depends on
 > BR2_PACKAGE_PYTHON' was removed for the main python-msgpack Config.in
 > option, but not from the comment. This commit fixes this
 > inconsistency.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
