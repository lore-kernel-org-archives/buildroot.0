From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 13:36:51 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <8dc16ff6-7184-262a-8564-7ab7e43412a1@mind.be>
References: <20171011105809.2bf05267@windsurf.lan>
 <1508170801-31062-1-git-send-email-anisse@astier.eu>
 <20171016185248.0463ac82@windsurf.lan>
 <20171016211842.GA32198@bifrost>
 <20171017091152.67d7ad28@windsurf.lan>
 <4234cedb-0646-496e-9ee1-0bc60c847810@mind.be>
 <20171017141133.4d57ee87@windsurf.lan>
 <9955dbb8-0447-5a3d-9e78-a0f6f42e7e6c@mind.be>
 <20171017210354.38d89b3c@windsurf.lan>
 <ff04b0db-d3d5-2314-9d9c-3ead377eb981@mind.be>
 <20171018085748.20a3a9f5@windsurf.home>
 <8dc16ff6-7184-262a-8564-7ab7e43412a1@mind.be>
Message-ID: <20171018133651.0a8ea508@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Oct 2017 12:57:30 +0200, Arnout Vandecappelle wrote:

>  As I said a couple of times already, I don't think we should enforce -Orecurse.

As I replied in another e-mail, I disagree :)

>  About the BR2_PARALLEL_BUILD option, it may be useful, but for the time being I
> would continue asking the user to remove the .NOTPARALLEL line.

The patch I have removes .NOTPARALLEL if BR2_PARALLEL_BUILD=y.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
