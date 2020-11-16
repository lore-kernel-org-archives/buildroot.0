From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 15:45:38 +0100
Subject: [Buildroot] [PATCH] package/rauc: prevent occurring the error
 when directory exists
In-Reply-To: <20201113113940.842415-1-b.bilas@grinn-global.com> (Bartosz
 Bilas's message of "Fri, 13 Nov 2020 12:39:40 +0100")
References: <20201113113940.842415-1-b.bilas@grinn-global.com>
Message-ID: <87h7pp7431.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Bilas <b.bilas@grinn-global.com> writes:

 > Add -p argument that ignore that specified directory already exists.
 > Fixes:
 >  mkdir: cannot create directory ?/home/bartekk/buildroot-2020.11-rc1/output/target/usr/lib/systemd/system/rauc.service.d?: File exists

 > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
