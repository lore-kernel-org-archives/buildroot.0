From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 13:44:28 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/ruby: enable openssl for
 host-ruby
In-Reply-To: <20191025133705.32021-1-nicolas.carrier@orolia.com> (Nicolas
 Carrier's message of "Fri, 25 Oct 2019 13:37:20 +0000")
References: <20191025133705.32021-1-nicolas.carrier@orolia.com>
Message-ID: <87pniez9lf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Carrier <nicolas.carrier@orolia.com> writes:

 > Openssl is required so that Gem can install ruby gems from secure websites.
 > ERROR:  While executing gem ... (Gem::Exception)
 >     Unable to require openssl, install OpenSSL and rebuild ruby (preferred) or
 > use non-HTTPS sources

 > Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
 > ---
 > Changes v1 -> v2:
 >   - remove original committer, since he has left the company
 >   - added dependency on host-openssl

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
