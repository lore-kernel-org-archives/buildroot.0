From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Apr 2021 18:06:26 +0200
Subject: [Buildroot] [PATCH 1/4] package/mender/mender.mk: use
 MENDER_PKGDIR variable
In-Reply-To: <20210320222835.3951325-2-aduskett@gmail.com> (aduskett's message
 of "Sat, 20 Mar 2021 15:28:32 -0700")
References: <20210320222835.3951325-1-aduskett@gmail.com>
 <20210320222835.3951325-2-aduskett@gmail.com>
Message-ID: <874kgn4akd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@rivian.com>
 > Currently there is a mix of calls to package/mender and $(MENDER_PKGDIR) in the
 > mender.mk file. Standardize the calls to only $(MENDER_PKGDIR).

 > Signed-off-by: Adam Duskett <Aduskett@rivian.com>

Committed to 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
