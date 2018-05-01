From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 09:33:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-requests fix dependencies
In-Reply-To: <20180429125339.28057-1-sven.haardiek@iotec-gmbh.de> (Sven
 Haardiek's message of "Sun, 29 Apr 2018 14:53:39 +0200")
References: <20180429125339.28057-1-sven.haardiek@iotec-gmbh.de>
Message-ID: <871sevkey9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Haardiek <sven.haardiek@iotec-gmbh.de> writes:

 > Requests need hashlib to run with Pyhton 2. Otherwise it is not possible to
 > import, due to missing e.g. md5. There is a variable BR2_PACKAGE_PYTHON_HASHLIB
 > to make it work.

 > Signed-off-by: Sven Haardiek <sven.haardiek@iotec-gmbh.de>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
