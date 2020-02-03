From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Feb 2020 14:22:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/openjdk and
 package/openjdk-bin: bump version to 13.0.2+8
In-Reply-To: <20200202203931.694941-1-aduskett@gmail.com> (Adam Duskett's
 message of "Sun, 2 Feb 2020 12:39:31 -0800")
References: <20200202203931.694941-1-aduskett@gmail.com>
Message-ID: <87pnevlsai.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > Other changes:
 >   - Add --with-stdc++lib=dynamic to openjdk.mk or else openjdk will fail to
 >     build because it defaults to looking for a static libstdc++ library.

 > Signed-off-by: Adam Duskett <aduskett@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
