From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 May 2010 22:00:27 +0200
Subject: [Buildroot] [PATCH 7/9] vlc: mark as broken
In-Reply-To: <45c3fedd820039d865281a12b6b06c2b05a149bd.1273440344.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 9 May 2010 23:26:41 +0200")
References: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
	<cover.1273440344.git.thomas.petazzoni@free-electrons.com>
	<45c3fedd820039d865281a12b6b06c2b05a149bd.1273440344.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87pr134jdw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Before 2010.02, VLC didn't build, because it didn't pass the
 Thomas> appropriate --disable- options according to the libraries available in
 Thomas> Buildroot. Now, 2010.05 is going to be released, and no one bothered
 Thomas> to fix VLC. Therefore, let's mark VLC as broken.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/multimedia/vlc/Config.in |    1 +
 Thomas>  1 files changed, 1 insertions(+), 0 deletions(-)

 Thomas> diff --git a/package/multimedia/vlc/Config.in b/package/multimedia/vlc/Config.in
 Thomas> index c8faaa7..a261607 100644
 Thomas> --- a/package/multimedia/vlc/Config.in
 Thomas> +++ b/package/multimedia/vlc/Config.in
 Thomas> @@ -1,5 +1,6 @@
 Thomas>  config BR2_PACKAGE_VLC
 Thomas>  	bool "vlc"
 Thomas> +	depends on BROKEN

It's nice to add a little comment about why it's broken, like we've done
for some of the other packages.

-- 
Bye, Peter Korsgaard
