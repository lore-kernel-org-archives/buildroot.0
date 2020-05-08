From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 May 2020 09:26:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/openjdk: Remove sparc support
In-Reply-To: <20200422170108.3161301-1-aduskett@gmail.com> (aduskett's message
 of "Wed, 22 Apr 2020 10:01:08 -0700")
References: <20200422170108.3161301-1-aduskett@gmail.com>
Message-ID: <874ksqubtl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Sparc support is deprecated and may be removed in future releases. There are
 > two choices to fix this issue:

 > 1) Set --enable-deprecated-ports=yes in the CONF_OPTS to supress the error.
 > 2) Remove support for Sparc.

 > Because this port is deprecated, it's safer to remove support alltogether.

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
