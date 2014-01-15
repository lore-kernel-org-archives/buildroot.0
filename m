From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Jan 2014 22:24:20 +0100
Subject: [Buildroot] [PATCH 3/3] protobuf-c: Don't require protobuf on
	target.
In-Reply-To: <1389687696-4824-3-git-send-email-stefan.sorensen@spectralink.com>
 ("Stefan =?utf-8?Q?S=C3=B8rensen=22's?= message of "Tue, 14 Jan 2014
 09:21:36 +0100")
References: <1389687696-4824-1-git-send-email-stefan.sorensen@spectralink.com>
 <1389687696-4824-3-git-send-email-stefan.sorensen@spectralink.com>
Message-ID: <874n55szuj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan S?rensen <stefan.sorensen@spectralink.com> writes:

 > protobuf-c only requires protobuf when building the protoc compiler,
 > hence protobuf can be dropped from the target dependencies.

 > Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
