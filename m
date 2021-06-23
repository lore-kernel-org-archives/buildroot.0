From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jun 2021 08:55:39 +0200
Subject: [Buildroot] [PATCH] package/libressl: fix openssldir setting to
 match openssl
In-Reply-To: <20210616160507.11223-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 16 Jun 2021 18:05:06 +0200")
References: <20210616160507.11223-1-peter@korsgaard.com>
Message-ID: <87zgvh5atw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > libressl defaults to $prefix/etc/ssl for its "openssldir" setting, E.G.
 > the location where configuration files and certificates are searched:

 > openssl version -d
 > OPENSSLDIR: "/usr/etc/ssl"

 > Change it to /etc/ssl so it matches openssl and the expectations of packages
 > dealing with certificates (ca-certificates, libcurl, p11-kit)

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
