From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 18 Oct 2011 16:44:46 +0000 (UTC)
Subject: [Buildroot] timer_create fails with return -1 errno 0
References: <j7k9n9$cru$1@dough.gmane.org>
Message-ID: <j7kadu$l9t$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2011-10-18, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> I can't figure out why timer_create() is failing.  It returns -1, but
> errno is 0: "Success".
>
> I'm using uClibc uClibc-0.9.30.3 (built by crosstool-NG) on an ARM926
> buildroot system.
>
> The same code ran fine using glibc on a desktop IA32 system.

Sorry, I meant to post that to the uclibc.general list...

-- 
Grant Edwards               grant.b.edwards        Yow! ... I see TOILET
                                  at               SEATS ...
                              gmail.com            
