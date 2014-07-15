From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 20:40:29 +0200
Subject: [Buildroot] [PATCH v2 1/1] Build Python with tzset support
In-Reply-To: <1404902339-25481-1-git-send-email-henry.margies@gmail.com>
References: <1404825833-1075-1-git-send-email-henry.margies@gmail.com>
 <1404902339-25481-1-git-send-email-henry.margies@gmail.com>
Message-ID: <20140715204029.00290aaf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Henry Margies,

On Wed,  9 Jul 2014 11:38:59 +0100, Henry Margies wrote:
> This patch adds support for time.tzset() in Python2.7 and Python3.
> 
> The Python configure script sets ac_cv_working_tzset to 'no' when
> cross compiling, although it should be available and work with all 
> toolchains supported by Buildroot (?).
> The patch below pre-sets the variable so that time.tzset() works.
> 
> 
> Signed-off-by: Henry Margies <henry.margies@gmail.com>
> ---
> Changes v1 -> v2:
>  - added similar patch for Python3

Applied, thanks. I've adjusted a bit the commit title, as the normal
format is:

	<package>: <what's happening>

Ideally, two separate patches, one for Python 2 and one for Python 3
would have been better, but ok for this time.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
