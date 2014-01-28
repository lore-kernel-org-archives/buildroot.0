From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jan 2014 23:01:31 +0100
Subject: [Buildroot] [PATCH] packge/pkg-cmake: disable colouring the
	output
In-Reply-To: <1390757822-17485-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 26 Jan 2014 18:37:02 +0100")
References: <1390757822-17485-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87ppnbzryc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > cmake is the only build-system we support that does colour its output,

 > Also, since parallel builds generates intermixed output lines, it makes
 > for ugly-looking output.

 > Just disable cmake colouring globally.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
