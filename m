From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 May 2020 09:25:28 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/openjdk: copy all
 directories and files when installing
In-Reply-To: <20200418190701.2629613-2-aduskett@gmail.com> (aduskett's message
 of "Sat, 18 Apr 2020 12:07:00 -0700")
References: <20200418190701.2629613-1-aduskett@gmail.com>
 <20200418190701.2629613-2-aduskett@gmail.com>
Message-ID: <878si2ubvb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Several directories and files are currently not installed during the
 > target installation, these include:
 >   - conf
 >     Several configuration files, including security configuration files which
 >     may be necessary for running various java applications.

 >   - legal
 >     This directory contains legal notices that some java applications may
 >     require, as they may print legal information and will throw exceptions at
 >     runtime if the legal files are not present on the system.

 >   - release
 >     This file contains a list of modules included in the image.

 > Because these directories take up less than of megabyte extra, it is not an
 > issue to install all of them.

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 > ---
 > Changes v1 -> v2:
 >   - Added a better explination for why the legal directory is necessary.

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
