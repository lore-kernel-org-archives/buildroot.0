From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 14:09:26 +0100
Subject: [Buildroot] [PATCH v3 4/5] package/mender: adding device_type
 file
In-Reply-To: <1549363799-30840-5-git-send-email-angelo@amarulasolutions.com>
 (Angelo Compagnucci's message of "Tue, 5 Feb 2019 11:49:58 +0100")
References: <1549363799-30840-1-git-send-email-angelo@amarulasolutions.com>
 <1549363799-30840-5-git-send-email-angelo@amarulasolutions.com>
Message-ID: <87sgx2nzzt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > In order to have the mender package working out of the box, the
 > /etc/mender/device_type should be present and should contain a
 > valid device_type value.
 > This patch provides a default file that can be overridden easily
 > from an overlay.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > Acked-by: <aduskett@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
