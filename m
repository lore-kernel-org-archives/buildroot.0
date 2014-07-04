From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 04 Jul 2014 11:17:37 -0300
Subject: [Buildroot] [PATCH 1/4] at: add license information
In-Reply-To: <87lhs95i1e.fsf@dell.be.48ers.dk>
References: <1404417639-5879-1-git-send-email-gustavo@zacarias.com.ar>
 <87lhs95i1e.fsf@dell.be.48ers.dk>
Message-ID: <53B6B781.3050909@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/04/2014 11:13 AM, Peter Korsgaard wrote:

>  > +AT_LICENSE = GPLv2+
>  > +AT_LICENSE_FILES = Copyright
> 
> That file lists files under GPLv2+, GPLv3+ and the NTP
> license. parsetime.pl is only used for 'make test', but wouldn't the
> combined license be GPLv3+ instead?
> 
> The COPYING file (which we probably should add to _LICENSE_FILES) is
> GPLv2 though.

Yeah i went for Copyright because of the complexities.
at.c which we could call main() is GPLv2+
parsetime.pl should be ingnored (tests, not installed, not used).
Only posixtm.c is v3+ but since it's linked to the other bits that are
v2+ the whole thing should probably be called v3+ (you can go down is my
interpretation, but you can go up).
Regards.
