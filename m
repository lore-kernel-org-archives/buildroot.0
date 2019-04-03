From: =?utf-8?B?U8O4cmVuc2VuLCBTdGVmYW4=?= <Stefan.Sorensen@spectralink.com>
Date: Wed, 3 Apr 2019 08:11:35 +0000
Subject: [Buildroot] [PATCH] gnutls: security bump to 3.6.7.1
In-Reply-To: <87h8bffrga.fsf@dell.be.48ers.dk>
References: <20190403061405.27273-1-stefan.sorensen@spectralink.com>
 <87h8bffrga.fsf@dell.be.48ers.dk>
Message-ID: <b8fc60a6fc72431a6caa166bd3ebb19a01077cb8.camel@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2019-04-03 at 10:01 +0200, Peter Korsgaard wrote:

> These issues were fixed in 3.6.7, weren't they? I don't see 3.6.7.1
> announced yet, what is the delta?

Guess I might have jumped the gun a bit...

Only change is that a file was missing from the release tarball:
https://gitlab.com/gnutls/gnutls/issues/745

Stefan
