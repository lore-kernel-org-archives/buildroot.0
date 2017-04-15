From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 09:25:33 +0200
Subject: [Buildroot] [PATCH][autobuild] Use last 4 lines of log instead
 of 3 when getting failure reason
In-Reply-To: <08c71f7a-4b90-46de-897b-726e53603b64@mind.be>
References: <1477478717-19209-1-git-send-email-vzakhar@synopsys.com>
 <20161026135259.425f0f0a@free-electrons.com>
 <1477484955.30609.16.camel@synopsys.com>
 <1478880282.3874.5.camel@synopsys.com>
 <08c71f7a-4b90-46de-897b-726e53603b64@mind.be>
Message-ID: <20170415092533.0c6f3cff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Apr 2017 00:48:48 +0200, Arnout Vandecappelle wrote:

>  Instead of relying on make's "noise", why don't we just use the very last line
> of build-time.log?

Good idea. I believe we rely on make noise, because build-time.log
didn't exist when the autobuild-run stuff was initially written.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
