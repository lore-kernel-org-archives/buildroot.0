From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Feb 2018 08:10:48 +0100
Subject: [Buildroot] [PATCH] python-virtualenv: new package
In-Reply-To: <1517523718-30586-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Thu, 1 Feb 2018 16:21:58 -0600")
References: <1517523718-30586-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87po5lz0uf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > A tool for creating a isolated python env.
 > Within Buildroot, the basic problem being addressed is
 > one of dependencies and versions, and indirectly permissions.
 > A great example are the Django and AMQP protocol packages.
 > An applications depending on these are usually locked into a specific
 > version.

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Can you explain what the use case for this is? Is this to install
additional python packages at runtime on the target?

-- 
Bye, Peter Korsgaard
