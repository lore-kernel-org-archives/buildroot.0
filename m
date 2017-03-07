From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Mar 2017 15:11:56 +0100
Subject: [Buildroot] [PATCH 1/1] pcre: Change download location
In-Reply-To: <878tohdvzu.fsf@dell.be.48ers.dk>
References: <5f582368-797e-10ad-1c19-a998496cabbf@ya.ru>
 <20170306212039.4134ccee@free-electrons.com>
 <87d1dtdzim.fsf@dell.be.48ers.dk>
 <20170307140253.60681b57@free-electrons.com>
 <878tohdvzu.fsf@dell.be.48ers.dk>
Message-ID: <20170307151156.1a3ae316@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 07 Mar 2017 15:03:49 +0100, Peter Korsgaard wrote:

> But how would this cause several TIMEOUTS? E.G. something where wget
> will try several times to contact the ftp server.
> 
> It should just have done a single ftp login + get, and as soon as it
> failed fall back to sources.buildroot.net unless something is causing
> the ftp connection to "hang".

Yes, agreed. I guess Oleg can explain more what's going.

But we all agree that the fix is good I suppose :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
