From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Feb 2017 10:03:59 +0100
Subject: [Buildroot] [PATCH 9/9] check-package: check *.mk for typo in
	variable
In-Reply-To: <20161231032110.11573-10-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sat, 31 Dec 2016 01:21:10 -0200")
References: <20161231032110.11573-1-ricardo.martincoski@gmail.com>
 <20161231032110.11573-10-ricardo.martincoski@gmail.com>
Message-ID: <87zihytls0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Warn when a variable is defined in a .mk file and it don't start with
 > the package name.

 > This function generates false warnings and the maintenance of the
 > whitelist can be an extra burden, but it catches some typos really hard
 > to see:
 > - POPLER_CONF_OPTS [1]
 > - BALELD_LICENSE [2]
 > - DRDB_UTILS_DEPENDENCIES [3]
 > - PERL_LIBWWW_LICENSE_FILES [4]
 > - AVRDUDR_LICENSE_FILES [5]
 > - GST1_PLUGINS_ULGY_HAS_GPL_LICENSE [6]
 > - ON2_8170_LICENSE [7]
 > - LIBFDTI_CONF_OPTS [8][9]
 > - IPSEC_DEPENDENCIES [10]

Thanks, I've fixed these typos!

-- 
Bye, Peter Korsgaard
