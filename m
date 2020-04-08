From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Apr 2020 13:33:17 +0200
Subject: [Buildroot] [PATCH 1/5] package/nftables: check for python
In-Reply-To: <20200330234616.1665466-1-aduskett@gmail.com> (aduskett's message
 of "Mon, 30 Mar 2020 16:46:12 -0700")
References: <20200330234616.1665466-1-aduskett@gmail.com>
Message-ID: <87r1wyky9u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > If python or python3 is selected, nftables should depend on the package
 > and set the --enable-python option, otherwise set --disable-python

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
