From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 11:48:09 +0100
Subject: [Buildroot] [PATCH v2/next 2/4] woff2: new package
In-Reply-To: <20180323185942.60252-3-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Fri, 23 Mar 2018 20:59:40 +0200")
References: <20180323185942.60252-1-aperez@igalia.com>
 <20180323185942.60252-3-aperez@igalia.com>
Message-ID: <87tvt521hy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Add the woff2 package to Builroot. This is needed by webkitgtk from
 > version 2.20.0 onwards. WebKitGTK+ used to bundle a copy of the library,
 > but it stopped doing so now that the upstream is has been making
 > releases.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

 > +# Locally generated:
 > +sha512  c788bba1530aec463e755e901f9342f4b599e3a07f54645fef1dc388ab5d5c30625535e5dd38e9e792e04a640574baa50eeefb6b7338ab403755f4a4e0c3044d  v1.0.2.tar.gz
 > +
 > +# Hash for license files:
 > +sha512  16d7a62757f9854cd0ff9750eb0b374a1360deded0ba1646fde430f79a8f7c36a85f4884faaf1ea90db02537cd8d8c314cfcbcf492be25af24e1e77aa5919ebb  LICENSE

This is the same (cut'n'pasted?) wrong hash for the LICENSE file as for
brotli. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
