From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Oct 2019 07:20:18 +0200
Subject: [Buildroot] [PATCH] package/hiawatha: bump to version 10.10
In-Reply-To: <20190930074447.2299-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 30 Sep 2019 09:44:46 +0200")
References: <20190930074447.2299-1-thomas.petazzoni@bootlin.com>
Message-ID: <87k19p11pp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Changes since 10.9:
 > - Removed several build options. Functionalities are now always enabled.
 > - mbed TLS updated to 2.16.3.
 > - Updated Let's Encrypt script due to changes in the API.
 > - Bugfix: AlterMode not working correctly.

 > Diffing the CMakeLists.txt between 10.9 and 10.10 does not show any
 > build option change that is relevant for us.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
