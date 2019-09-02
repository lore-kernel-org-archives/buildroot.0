From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 13:42:07 +0200
Subject: [Buildroot] [PATCH] package/dhcp: fix installation with
 BR2_STATIC_LIBS=y
In-Reply-To: <20190809022728.8521-1-unixmania@gmail.com>
 (unixmania@gmail.com's message of "Thu, 8 Aug 2019 23:27:28 -0300")
References: <20190809022728.8521-1-unixmania@gmail.com>
Message-ID: <87mufmzzzk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > We disable libtool for static builds so the binaries are not in a
 > ".libs" subdir.

 > Fixes:
 >   http://autobuild.buildroot.net/results/0c43c02b8d418b60b4734187abde1da585e9e0ca/
 >   http://autobuild.buildroot.net/results/e61b246df60af1e59b8f643510557ef2270f2d97/

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Committed to 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
