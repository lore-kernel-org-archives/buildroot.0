From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Apr 2021 11:09:12 +0200
Subject: [Buildroot] [PATCH 4/4] package/mender: install dbus
 authentication file if dbus is selected
In-Reply-To: <20210320222835.3951325-5-aduskett@gmail.com> (aduskett's message
 of "Sat, 20 Mar 2021 15:28:35 -0700")
References: <20210320222835.3951325-1-aduskett@gmail.com>
 <20210320222835.3951325-5-aduskett@gmail.com>
Message-ID: <87r1jq2z7r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@rivian.com>
 > While not a requirement to run mender itself, the mender-connect package
 > requires this file to be installed to talk to mender.

 > Signed-off-by: Adam Duskett <Aduskett@rivian.com>

Committed to 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
