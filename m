From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Apr 2021 18:06:41 +0200
Subject: [Buildroot] [PATCH 2/4] package/mender/mender.mk: fix linker
 version argument
In-Reply-To: <20210320222835.3951325-3-aduskett@gmail.com> (aduskett's message
 of "Sat, 20 Mar 2021 15:28:33 -0700")
References: <20210320222835.3951325-1-aduskett@gmail.com>
 <20210320222835.3951325-3-aduskett@gmail.com>
Message-ID: <87zgyf2vzi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@rivian.com>
 > The current linker flag "-X main.Version=$(MENDER_VERSION)" no longer points
 > to the correct location, which results in "version: unknown" when runnning
 > "mender -version." Update the linker flag to point to the correct location.

 > Signed-off-by: Adam Duskett <Aduskett@rivian.com>

Committed to 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
