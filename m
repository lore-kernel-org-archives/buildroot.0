From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 22 Mar 2016 17:50:05 +0100
Subject: [Buildroot] [PATCH v2 1/1] gnuradio: fix compilation with
	cmake-3.5
References: <1458646304-339-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <tm98scxncf.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gwenhael,

Am Tue, 22 Mar 2016 12:31:44 +0100 schrieb Gwenhael Goavec-Merou:

> fix:

> http://autobuild.buildroot.net/results/
ddee04bf8c477fb8ae6fe7f15b112485797dd96e/

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(compile tested)

> fix partially :
> 
> http://autobuild.buildroot.net/
results/33748edd3555296c1d8a8b49c83bca6003781993/

This defconfig compiles with this additional patch from cmake release 
branch applied:
https://github.com/Kitware/CMake/commit/
e2f387fabbf6af84444665b88b8933ef5ed5cb59

Regards, Bernd
