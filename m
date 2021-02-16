From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Feb 2021 08:33:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/unbound: security bump to
 version 1.13.1
In-Reply-To: <20210215225305.25250-1-stefan@ott.net> (Stefan Ott via
 buildroot's message of "Mon, 15 Feb 2021 23:53:05 +0100")
References: <20210215225305.25250-1-stefan@ott.net>
Message-ID: <87eehga2mg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Ott via buildroot <buildroot@busybox.net> writes:

 > This release contains a number of bug fixes. There is added support
 > for the EDNS Padding option (RFC7830 and RFC8467), and the EDNS NSID
 > option (RFC 5001). Unbound control has added commands to enable and
 > disable rpz processing. Reply callbacks have a start time passed to
 > them that can be used to calculate time, these are callbacks for
 > response processing. With the option serve-original-ttl the TTL served
 > in responses is the original, not counted down, value, for when in
 > front of authority service.

What exactly is the security sensitive fix? The release seems to be a
mix of features and bugfixes, but I don't right away see anything that
is singled out as a security fix?

-- 
Bye, Peter Korsgaard
