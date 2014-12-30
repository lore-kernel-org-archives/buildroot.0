From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Dec 2014 00:42:51 +0100
Subject: [Buildroot] [PATCH 2/2] upmpdcli: add missing comment
	dependency propagation
In-Reply-To: <1419859373-13766-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 29 Dec 2014 14:22:53 +0100")
References: <1419859373-13766-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1419859373-13766-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878uhobt6s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > upmpdcli cannot be built with the Blackfin toolchains, but the comment
 > could be shown with such toolchains, which doesn't make sense. This
 > commit properly propagates the toolchain exceptions of the package
 > config symbol to the Config.in comment.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
