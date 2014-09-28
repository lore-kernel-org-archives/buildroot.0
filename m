From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Sep 2014 21:25:39 +0200
Subject: [Buildroot] [PATCH] lighttpd PAM auth
In-Reply-To: <53E4B0FE.3020703@tind.sk> (Stanislav Ravas's message of "Fri, 08
 Aug 2014 13:14:06 +0200")
References: <53E4B0FE.3020703@tind.sk>
Message-ID: <87oatzv970.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stanislav" == Stanislav Ravas <ravas@tind.sk> writes:

 > Hello,
 > this patch adds basic support for PAM authentification to lighttpd. It
 > applies to version 1.4.35.

 > I have submitted this patch to lighttpd upstream too, but I doubt they
 > will accept.

Sorry, we don't want to carry feature patches in Buildroot, especially
if they don't stand a chance getting upstreamed.

-- 
Bye, Peter Korsgaard
