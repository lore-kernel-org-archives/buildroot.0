From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Jan 2011 16:47:04 +0100
Subject: [Buildroot] [PATCH 1/1] zlib: disable call to ldconfig
In-Reply-To: <a67fb1cdf7c4a2364c4b92c7436ad2e3a3265421.1296030417.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Wed, 26 Jan 2011 09:27:03 +0100")
References: <cover.1296030417.git.thomas.petazzoni@free-electrons.com>
	<cover.1296030417.git.thomas.petazzoni@free-electrons.com>
	<a67fb1cdf7c4a2364c4b92c7436ad2e3a3265421.1296030417.git.thomas.petazzoni@free-electrons.com>
Message-ID: <877hdrvf9j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> By default, zlib installation procedure calls ldconfig, which takes
 Thomas> time uselessly. ldconfig is only useful if you install libraries on
 Thomas> the host (in directories listed in /etc/ld.so.conf, or in /usr/lib or
 Thomas> /lib), so calling it after installing libraries in $(STAGING_DIR),
 Thomas> $(TARGET_DIR) or $(HOST_DIR) is just a lenghty no-op.

Committed, thanks.

-- 
Bye, Peter Korsgaard
