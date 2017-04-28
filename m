From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Apr 2017 23:07:59 +0200
Subject: [Buildroot] [PATCH] ola: mark as broken
In-Reply-To: <939b0c39-d10b-c699-8367-41f7e57cd4fe@mind.be>
References: <78a929f7208b78d17f45d4ddb8bc8df7f26ba74b.1493388478.git.baruch@tkos.co.il>
 <939b0c39-d10b-c699-8367-41f7e57cd4fe@mind.be>
Message-ID: <20170428230759.64d4427c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Apr 2017 21:53:18 +0200, Arnout Vandecappelle wrote:

>  We kind of decided a few months ago not use BROKEN anymore, except if we expect
> that it will be repaired again very soon. The idea was that any BROKEN thing
> would be converted into removal with legacy handling at time of release. Do we
> expect the issue to be fixed by then?
> 
>  If not (probably not), I believe the proper approach is to remove, with legacy
> handling. If the issue gets fixed somewhere down the line, the removal can be
> reverted again.
> 
>  Make sure the help text of the legacy symbol clearly describes the problem, so
> that anyone who actually needs the package can try to fix it.

I think we can leave this as BROKEN, and shortly before the release
really remove it if upstream has not fixed it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
