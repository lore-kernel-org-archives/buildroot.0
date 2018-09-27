From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 21:36:55 +0200
Subject: [Buildroot] [PATCH 1/1] haproxy: new package
In-Reply-To: <20180921205619.25242-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 21 Sep 2018 22:56:19 +0200")
References: <20180921205619.25242-1-fontaine.fabrice@gmail.com>
Message-ID: <87ftxuag14.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > HAProxy is a free, very fast and reliable solution offering
 > high availability, load balancing, and proxying for TCP and
 > HTTP-based applications.

 > http://www.haproxy.org

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

..

 > +# pcre and pcre2 can't be enabled at the same time so prefer pcre2
 > +# Set PCRE2_DIR as by haproxy will try to use pcre2-config and will default to
 > +# /usr/local

"as by" sounds a bit odd, so I've reworded this slightly and committed,
thanks!

Notice that 1.8.14 has been released which fixes a security issue, so it
would be good if you could send an update:

https://www.mail-archive.com/haproxy at formilux.org/msg31253.html

-- 
Bye, Peter Korsgaard
