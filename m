From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jul 2020 09:05:35 +0200
Subject: [Buildroot] [PATCH] toolchain: adjust version check to allow
 for single numbers
In-Reply-To: <20200610235313.204905-1-nolange79@gmail.com> (Norbert Lange's
 message of "Thu, 11 Jun 2020 01:53:12 +0200")
References: <20200610235313.204905-1-nolange79@gmail.com>
Message-ID: <871rlflwsg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Norbert" == Norbert Lange <nolange79@gmail.com> writes:

 > A gcc compiler, which was configured with
 > --with-gcc-major-version-only, will only return a single
 > number. (debian does this for example).

 > A simple modification allows the check to work with both
 > single numbers (eg. '9') and full versions (eg. '9.2.1').

 > Signed-off-by: Norbert Lange <nolange79@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
