From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 21:22:14 +0100
Subject: [Buildroot] [PATCH v7 4/8] mariadb: use host-openssl from
 buildroot-system
In-Reply-To: <20190204211037.6f5df78e@gmx.net> (Peter Seiderer's message of
 "Mon, 4 Feb 2019 21:10:37 +0100")
References: <20190129093919.22060-1-patrick.havelange@essensium.com>
 <20190129093919.22060-4-patrick.havelange@essensium.com>
 <874l9jykc4.fsf@dell.be.48ers.dk> <20190204211037.6f5df78e@gmx.net>
Message-ID: <875ztzs3rd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

Hi,

 >> > +HOST_MARIADB_CONF_OPTS += -DWITH_SSL=system  
 >> 
 >> I don't quite get this patch. What is the relation to the openssl bump?

 > It was related back in 2018 when suggested by Ryan Coe ([1])...

 >> 
 >> From the error message it sounds like mariadb perhaps has gnutls
 >> support, and it ends up falling back to that if SSL support is disabled?
 >> Can't we just disable that?
 >> 

 > ...and pre commit 9276747defdd4f91ec21ba0930afdf6d947730b6 which disabled
 > ssl support for the host build (did not get it right while rebasing the
 > openssl bump patch series), so yes, this patch can be dropped...

Thanks, I have marked it as rejected in patchwork.

-- 
Bye, Peter Korsgaard
