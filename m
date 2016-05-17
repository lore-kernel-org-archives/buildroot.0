From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 15:25:49 +0200
Subject: [Buildroot] [PATCH next] boost: remove
	BR2_PACKAGE_BOOST_ARCH_SUPPORTS option
In-Reply-To: <1463490035-22839-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 17 May 2016 15:00:35 +0200")
References: <1463490035-22839-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87lh38byua.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The BR2_PACKAGE_BOOST_ARCH_SUPPORTS option was originally added in
 > commit feeab03fa68a02733ae9382b7d47d9eb0d785188 to be able to disable
 > Boost on broken NIOSII CodeSourcery toolchains.

 > However, since then, the CodeSourcery toolchain has been updated, and
 > once the fenv problem is fixed, this NIOSII toolchain is capable of
 > building Boost.

 > Thanks to this we can completely get rid of the
 > BR2_PACKAGE_BOOST_ARCH_SUPPORTS symbol, from boost itself and from all
 > its reverse dependencies.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/boost/Config.in            | 5 -----
 >  package/cc-tool/Config.in          | 2 --
 >  package/gnuradio/Config.in         | 2 --
 >  package/kodi/Config.in             | 1 -
 >  package/libftdi/Config.in          | 2 --
 >  package/libftdi1/Config.in         | 2 --
 >  package/libserial/Config.in        | 2 --
 >  package/mpd/Config.in              | 2 --
 >  package/pulseview/Config.in        | 2 --
 >  package/python-libconfig/Config.in | 2 --
 >  package/thrift/Config.in           | 2 --
 >  package/valijson/Config.in         | 2 --
 >  package/yaml-cpp/Config.in         | 2 --
 >  package/zmqpp/Config.in            | 2 --
 >  14 files changed, 30 deletions(-)

Wee! Committed to next, thanks.

-- 
Bye, Peter Korsgaard
