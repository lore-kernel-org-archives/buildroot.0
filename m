From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Jan 2019 15:08:35 +0100
Subject: [Buildroot] [PATCH v7 3/8] package/pound: Fix build with
 OpenSSL 1.1.x
In-Reply-To: <87lg3379ay.fsf@dell.be.48ers.dk>
References: <20190129093919.22060-1-patrick.havelange@essensium.com>
 <20190129093919.22060-3-patrick.havelange@essensium.com>
 <87lg3379ay.fsf@dell.be.48ers.dk>
Message-ID: <fb239a34-ee70-faa7-9bd4-d2a9aaf3f241@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/01/2019 16:49, Peter Korsgaard wrote:
> This looks to break building against libressl:

 Indeed, looks like it needs libressl exceptions as well.

 Regards,
 Arnout
