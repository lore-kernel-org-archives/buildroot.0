From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Mar 2020 20:41:53 +0100
Subject: [Buildroot] [PATCH 1/1] meson: Strip quotes from BR2_ENDIAN
In-Reply-To: <20200311183833.23074-1-glex.spb@gmail.com> (Gleb Mazovetskiy's
 message of "Wed, 11 Mar 2020 18:38:33 +0000")
References: <20200311183833.23074-1-glex.spb@gmail.com>
Message-ID: <87blop5wce.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gleb" == Gleb Mazovetskiy <glex.spb@gmail.com> writes:

 > Strips the quotes from BR2_ENDIAN because meson expects the value to be
 > unquoted.

 > Also uses the same values in target-specific cross-config as in the /etc
 > one.

 > Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
