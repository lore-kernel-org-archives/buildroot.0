From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2020 11:27:49 +0200
Subject: [Buildroot] [PATCH] package/gcc: remove gcc 7.5.0
In-Reply-To: <20201003091704.1537916-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 3 Oct 2020 11:17:04 +0200")
References: <20201003091704.1537916-1-romain.naour@gmail.com>
Message-ID: <87362uuyqy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > gcc 10.2 is around, gcc 9.3 is the default version, so drop
 > 7.5 in order to reduce the gcc choice.

 > See:
 > https://gcc.gnu.org/legacy-ml/gcc/2019-11/msg00099.html

 > The last defconfig using gcc 7 (roseapplepi_defconfig) has been
 > updated by 9cd065438020582011f393bd71308717b07c5a71.

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed after adding a Config.in.legacy entry for it, thanks.

-- 
Bye, Peter Korsgaard
