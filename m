From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 19:06:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/unbound: bump to version 1.13.1
In-Reply-To: <20210221004750.3639-1-stefan@ott.net> (Stefan Ott via
 buildroot's message of "Sun, 21 Feb 2021 01:47:50 +0100")
References: <20210221004750.3639-1-stefan@ott.net>
Message-ID: <87a6rps7vh.fsf@dell.be.48ers.dk>
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

 > https://github.com/NLnetLabs/unbound/releases/tag/release-1.13.1

 > Signed-off-by: Stefan Ott <stefan@ott.net>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
