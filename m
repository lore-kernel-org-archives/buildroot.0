From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Aug 2019 12:18:01 +0200
Subject: [Buildroot] [PATCH 03/08] package/python-hiredis: new package
In-Reply-To: <20190804011631.86261-4-aduskett@gmail.com> (aduskett@gmail.com's
 message of "Sat, 3 Aug 2019 21:16:26 -0400")
References: <20190804011631.86261-1-aduskett@gmail.com>
 <20190804011631.86261-4-aduskett@gmail.com>
Message-ID: <87blx52q06.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Python extension that wraps protocol parsing code in hiredis.
 > It primarily speeds up parsing of multi bulk replies.

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

We already had a very similar patch pending in patchwork:

https://patchwork.ozlabs.org/patch/1057597/

So I applied that one and marked this as superseeded.

-- 
Bye, Peter Korsgaard
