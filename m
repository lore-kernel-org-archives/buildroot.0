From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 May 2018 21:29:47 +0200
Subject: [Buildroot] [PATCH] Config.in: add BR2_HOST_GCC_AT_LEAST_8
In-Reply-To: <20180502100904.29985-1-chemobejk@gmail.com> (Stefan Becker's
 message of "Wed, 2 May 2018 13:09:04 +0300")
References: <20180502100904.29985-1-chemobejk@gmail.com>
Message-ID: <87o9hxetzo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Becker <chemobejk@gmail.com> writes:

 > Fedora 28 switched to GCC 8.x.
 > Signed-off-by: Stefan Becker <chemobejk@gmail.com>
 > ---
 >  Config.in | 6 ++++++
 >  1 file changed, 6 insertions(+)

 > diff --git a/Config.in b/Config.in
 > index 62d2dc3473..0d24ba6ebc 100644
 > --- a/Config.in
 > +++ b/Config.in
 > @@ -62,6 +62,12 @@ config BR2_HOST_GCC_AT_LEAST_7
 >  	default y if BR2_HOST_GCC_VERSION = "7"
 >  	select BR2_HOST_GCC_AT_LEAST_6
 
 > +config BR2_HOST_GCC_AT_LEAST_8
 > +	bool
 > +	default y if BR2_HOST_GCC_VERSION = "8"
 > +	select BR2_HOST_GCC_AT_LEAST_7
 > +

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
