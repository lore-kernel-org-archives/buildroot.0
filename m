From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Tue, 13 Mar 2012 15:34:36 +0000
Subject: [Buildroot] [PATCH] imagemagick: Ignore host's xml2-config
In-Reply-To: <87399cldsm.fsf@macbook.be.48ers.dk>
References: <1331645708-7650-1-git-send-email-markos.chandras@imgtec.com>
 <877gyoli9n.fsf@macbook.be.48ers.dk> <4F5F544B.4000601@imgtec.com>
 <4F5F56AD.2020408@imgtec.com> <4F5F59B6.7000002@imgtec.com>
 <87399cldsm.fsf@macbook.be.48ers.dk>
Message-ID: <4F5F690C.5000907@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/13/2012 03:29 PM, Peter Korsgaard wrote:

>>>>>> "Markos" == Markos Chandras <Markos.Chandras@imgtec.com> writes:
> 
> Hi,
> 
>  Markos> Yes, for whatever reason the buildroot infrastructure ignored
>  Markos> that patch and never got applied. I guess my tree was broken
>  Markos> somehow. Apologies for the noise. Please ignore my patch.
> 
> The patch logic is somewhat complicated (and we're cleaning it up) - If
> any patches match <package>-<version>-*.patch, then all other patches
> are ignored.
> 

Yeah I noticed that a bit late after spending some time reading the
package/Makefile.package.in file. Thanks for clarifying this.

-- 
markos
