From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 21 Apr 2011 07:41:56 +0200
Subject: [Buildroot] [PATCH 2/7] iproute2: bump to version 2.6.38
In-Reply-To: <1303321319-16553-2-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Wed, 20 Apr 2011 14:41:54 -0300")
References: <1303321319-16553-1-git-send-email-gustavo@zacarias.com.ar>
	<1303321319-16553-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871v0w17q3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  .../iproute2/iproute2-2.6.37-optional-ipv6.patch   |   94 --------------------
 Gustavo>  package/iproute2/iproute2-optional-ipv6.patch      |   94 ++++++++++++++++++++
 Gustavo>  package/iproute2/iproute2.mk                       |    2 +-
 Gustavo>  3 files changed, 95 insertions(+), 95 deletions(-)
 Gustavo>  delete mode 100644 package/iproute2/iproute2-2.6.37-optional-ipv6.patch
 Gustavo>  create mode 100644 package/iproute2/iproute2-optional-ipv6.patch


Committed, thanks. It would be good if you configure git to detet
renames, so I right away can see that the patch didn't change.

E.G. add:

[diff]
	renames = "copy"

to your ~/.gitconfig

-- 
Bye, Peter Korsgaard
