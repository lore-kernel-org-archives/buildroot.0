From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 21:55:20 +1300
Subject: [Buildroot] [PATCH] oprofile: Include operf command
In-Reply-To: <1482453206.8507.24.camel@kymetacorp.com>
References: <1482453206.8507.24.camel@kymetacorp.com>
Message-ID: <20170127215520.771ca1c4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Dec 2016 00:32:40 +0000, Trent Piepho wrote:
> This is the main command to control oprofile.  It was introduced in
> version 0.9.8 from 2012-08-27 and in version 1.0.0 the previous
> control tool, opcontrol, was removed.
> 
> In commit 9863553fe8fa16a4d19f652b409a44bb58ef5567, removing avr32
> support, code that added operf for !avr32 was removed rather than
> keeping the code but making it non-conditional.
> 
> Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>
> ---
>  package/oprofile/oprofile.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
