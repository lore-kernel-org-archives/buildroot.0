From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Apr 2010 09:51:43 +0200
Subject: [Buildroot] [PATCH 25/41] openssh: added empty login option
In-Reply-To: <1271199974-30434-26-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Wed, 14 Apr 2010 01:05:58 +0200")
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-26-git-send-email-llandwerlin@gmail.com>
Message-ID: <874ojeii9c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> ---
 llandwerlin>  package/openssh/Config.in  |    4 ++++
 llandwerlin>  package/openssh/openssh.mk |    8 ++++++++
 llandwerlin>  2 files changed, 12 insertions(+), 0 deletions(-)

 llandwerlin> diff --git a/package/openssh/Config.in b/package/openssh/Config.in
 llandwerlin> index 0c3d993..fb5daf8 100644
 llandwerlin> --- a/package/openssh/Config.in
 llandwerlin> +++ b/package/openssh/Config.in
 llandwerlin> @@ -7,3 +7,7 @@ config BR2_PACKAGE_OPENSSH
 llandwerlin>  	  tools.  The standard 'ssh', 'sshd', 'scp', and friends.
 
 llandwerlin>  	  http://www.openssh.com/
 llandwerlin> +
 llandwerlin> +config BR2_PACKAGE_OPENSSH_EMPTY_PASSWORDS
 llandwerlin> +	bool "allow empty passwords"
 llandwerlin> +        depends on BR2_PACKAGE_OPENSSH

Indentation should be with a <tab>

-- 
Bye, Peter Korsgaard
