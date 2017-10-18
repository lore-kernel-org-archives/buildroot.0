From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 08:53:24 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <07c2fee3-d73c-bb09-444d-2fcdf67415bf@mind.be>
References: <20171011105809.2bf05267@windsurf.lan>
 <1508170801-31062-1-git-send-email-anisse@astier.eu>
 <20171016185248.0463ac82@windsurf.lan>
 <20171016211842.GA32198@bifrost>
 <20171017091152.67d7ad28@windsurf.lan>
 <4234cedb-0646-496e-9ee1-0bc60c847810@mind.be>
 <20171017154526.GA6368@bifrost>
 <07c2fee3-d73c-bb09-444d-2fcdf67415bf@mind.be>
Message-ID: <20171018085324.0aef5c51@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Oct 2017 00:58:20 +0200, Arnout Vandecappelle wrote:

>  A GNU make loadable module, I never heard of that. Is that really an option?
> That could really be useful, also for other things.

https://www.gnu.org/software/make/manual/html_node/Loading-Objects.html#Loading-Objects

Allows to create new functions, written in C, available from make. I
think it only exists since make 4.x, but that statement should be
verified.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
