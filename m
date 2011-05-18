From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 May 2011 17:37:17 +0200
Subject: [Buildroot] [PATCH 09/10] libgtk2: add option to install the
	gtk-demo program
In-Reply-To: <d9451fbf4cec2d4a7533fb4dd0fa5853b61e93f0.1305713253.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Wed, 18 May 2011 12:08:27 +0200")
References: <cover.1305713253.git.thomas.petazzoni@free-electrons.com>
	<cover.1305713253.git.thomas.petazzoni@free-electrons.com>
	<d9451fbf4cec2d4a7533fb4dd0fa5853b61e93f0.1305713253.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87y624uij6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/libgtk2/Config.in  |    7 +++++++
 Thomas>  package/libgtk2/libgtk2.mk |    2 ++
 Thomas>  2 files changed, 9 insertions(+), 0 deletions(-)

 Thomas> diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
 Thomas> index 38b0b47..b5c42ef 100644
 Thomas> --- a/package/libgtk2/Config.in
 Thomas> +++ b/package/libgtk2/Config.in
 Thomas> @@ -16,5 +16,12 @@ config BR2_PACKAGE_LIBGTK2
 
 Thomas>  	  http://www.gtk.org/
 
 Thomas> +config BR2_PACKAGE_LIBGTK2_DEMO
 Thomas> +        bool "Install libgtk2 demo program"
 Thomas> +	depends on BR2_PACKAGE_LIBGTK2

bool line should be indented with a <tab>

-- 
Bye, Peter Korsgaard
