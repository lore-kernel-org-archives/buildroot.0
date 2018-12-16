From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:05:20 +0100
Subject: [Buildroot] [PATCH] libopenssl: Use HTTPS for URL
In-Reply-To: <20181210100635.7611-1-joel@jms.id.au> (Joel Stanley's message of
 "Mon, 10 Dec 2018 20:36:35 +1030")
References: <20181210100635.7611-1-joel@jms.id.au>
Message-ID: <87k1k96v3j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joel" == Joel Stanley <joel@jms.id.au> writes:

 > The host forces HTTPS regardless. This can be seen in the build logs:
 >>>> host-libopenssl 1.0.2q Downloading
 >  URL transformed to HTTPS due to an HSTS policy
 >  --2018-12-10 09:53:27--  https://www.openssl.org/source/openssl-1.0.2q.tar.gz

 > Signed-off-by: Joel Stanley <joel@jms.id.au>


Committed to 2018.02.x, 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
