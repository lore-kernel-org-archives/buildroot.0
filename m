From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 13:56:24 +0100
Subject: [Buildroot] [PATCH 19/22] dependencies: add details about which
	distro package to install
In-Reply-To: <1364113606-20836-20-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 09:26:43 +0100")
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364113606-20836-20-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k3oxklc7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  support/dependencies/dependencies.sh |    8 +++++++-
 Thomas>  1 file changed, 7 insertions(+), 1 deletion(-)

 Thomas> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
 Thomas> index 9d06a0d..ab7f4a4 100755
 Thomas> --- a/support/dependencies/dependencies.sh
 Thomas> +++ b/support/dependencies/dependencies.sh
 Thomas> @@ -135,7 +135,13 @@ for prog in patch perl tar wget cpio python unzip rsync ${DL_TOOLS} ; do
 Thomas>      if ! which $prog > /dev/null ; then
 Thomas>  	/bin/echo -e "You must install '$prog' on your build machine";
 Thomas>  	if test $prog = "svn" ; then
 Thomas> -	    /bin/echo -e "svn is usually part of the subversion package in your distribution"
 Thomas> +	    /bin/echo -e "  svn is usually part of the subversion package in your distribution"

I'm not sure I like the indentation, but ok - Committed, thanks.

-- 
Bye, Peter Korsgaard
